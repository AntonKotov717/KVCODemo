//
//  Children.m
//  KVCODemo
//
//  Created by dev on 12/28/15.
//  Copyright © 2015 dev. All rights reserved.
//

#import "Children.h"

@implementation Children

-(instancetype) init{
    self = [super init];
    if (self) {
        self.name = @"";
        self.age = 0;
        
        self.siblings = [[NSMutableArray alloc]init];
        self.arry = [[NSMutableArray alloc]init];
    }
    return self;
}

+(BOOL) automaticallyNotifiesObserversForKey:(NSString *)key{
    if ([key isEqualToString:@"name"]) {
        return NO;
    }else{
        return [super automaticallyNotifiesObserversForKey:key];
    }
}
/////////////// siblings //////////
-(NSUInteger)countOfSiblings{
    return self.siblings.count;
}
-(id)objectInSiblingsAtIndex:(NSUInteger)index{
    return [self.siblings objectAtIndex:index];
}
-(void)insertObject:(NSString *)object inSiblingsAtIndex:(NSUInteger)index{
    [self.siblings insertObject:object atIndex:index];
}
-(void)removeObjectFromSiblingsAtIndex:(NSUInteger)index{
    [self.siblings removeObjectAtIndex:index];
}

///////////////// arry ////////////
-(NSUInteger)countOfArry{
    return self.arry.count;
}

-(id)objectInArryAtIndex:(NSUInteger)index{
    return [self.arry objectAtIndex:index];
}
-(void)insertObject:(NSString *)object inArrysAtIndex:(NSUInteger)index{
    [self.arry insertObject:object atIndex:index];
}
-(void)removeObjectFromArryAtIndex:(NSUInteger)index{
    [self.arry removeObjectAtIndex:index];
}


@end
