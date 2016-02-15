//
//  ViewController.m
//  KVCODemo
//
//  Created by dev on 12/28/15.
//  Copyright © 2015 dev. All rights reserved.
//

#import "ViewController.h"
#import "Children.h"

static void *child1Context = &child1Context;
static void *child2Context = &child2Context;
static void *child3Context = &child3Context;

@interface ViewController ()

    @property (nonatomic, strong) Children * child1;
    @property (nonatomic, strong) Children * child2;
    @property (nonatomic, strong) Children * child3;





@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.child1 = [[Children alloc]init];
    self.child1.name = @"George1";
    self.child1.age = 15;
    NSLog(@"%@, %ld", self.child1.name, (long)self.child1.age);
    
    // Equal
    self.child2 = [[Children alloc]init];
    [self.child2 setValue:@"George2" forKey:@"name"];
    [self.child2 setValue:[NSNumber numberWithInteger:25] forKey:@"age"];
    self.child2.child = [[Children alloc]init];
    NSString *childName = [self.child2 valueForKey:@"name"];
    NSUInteger childAge = [[self.child2 valueForKey:@"age" ] integerValue];
    // self.child2.child.name = @"Sergey";
    [self.child2 setValue:@"Andrew" forKeyPath:@"child.name"];
    
    NSLog(@"%@, %ld, child.name: %@", childName, (long)childAge, self.child2.child.name);
    
    // for manual notification
    self.child3 = [[Children alloc]init];
    [self.child3 setValue:@"George3" forKey:@"name"];
    [self.child3 setValue:[NSNumber numberWithInteger:30] forKey:@"age"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.child1 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:child1Context];
    [self.child1 addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:child1Context];
    
    [self.child2 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:child2Context];
    [self.child2 addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:child2Context];
    
    [self.child3 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:child3Context];
    [self.child3 addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:child3Context];
    
    // Value change
    [self.child1 setValue:@"Michael" forKey:@"name"];
    [self.child1 setValue:[NSNumber numberWithInteger:20 ] forKey:@"age"];
    
    [self.child2 setValue:@"Adam" forKey:@"name"];
    [self.child2 setValue:[NSNumber numberWithInteger:45] forKey:@"age"];
    
    [self.child3 willChangeValueForKey:@"name"];
    self.child3.name = @"Sergey";
    [self.child3 didChangeValueForKey:@"name"];
    
    
    // for array KVO
    [self.child1 addObserver:self forKeyPath:@"siblings" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    [self.child1 insertObject:@"Alex" inSiblingsAtIndex:0];
    [self.child1 insertObject:@"Bob" inSiblingsAtIndex:1];
    [self.child1 insertObject:@"Mary" inSiblingsAtIndex:2];
    [self.child1 removeObjectFromSiblingsAtIndex:1];
 
    [self.child1 insertObject:@"AAlex" inArryAtIndex:0];
    [self.child1 insertObject:@"ABob" inArryAtIndex:1];
    [self.child1 insertObject:@"AMary" inArryAtIndex:2];
    [self.child1 removeObjectFromArryAtIndex:1];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self.child1 removeObserver:self forKeyPath:@"name"];
    [self.child1 removeObserver:self forKeyPath:@"age"];
    
    [self.child2 removeObserver:self forKeyPath:@"name"];
    [self.child2 removeObserver:self forKeyPath:@"age"];
    
    // value change notification Manually
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if (context == child1Context) {
        if ([keyPath isEqualToString:@"name"]) {
            NSLog(@"The name of the First child was changed.");
            NSLog(@"%@", change);
        }
        if ([keyPath isEqualToString:@"age"]) {
            NSLog(@"The age of the First child was changed.");
            NSLog(@"%@", change);
        }
    }
    else if (context == child2Context){
        if ([keyPath isEqualToString:@"name"]) {
            NSLog(@"The name of the Second child was changed.");
            NSLog(@"%@", change);
        }
        if ([keyPath isEqualToString:@"age"]) {
            NSLog(@"The age of the Second child was changed.");
            NSLog(@"%@", change);
        }
    }
    else if (context == child3Context){
        if ([keyPath isEqualToString:@"name"]) {
            NSLog(@"The name of the Third child was changed.");
            NSLog(@"%@", change);
        }
        if ([keyPath isEqualToString:@"age"]) {
            NSLog(@"The age of the Third child was changed.");
            NSLog(@"%@", change);
        }
    }else{
        if ([keyPath isEqualToString:@"siblings"]) {
            NSLog(@"%@", change);
        }
    }
}




@end
