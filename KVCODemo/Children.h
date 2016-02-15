//
//  Children.h
//  KVCODemo
//
//  Created by dev on 12/28/15.
//  Copyright © 2015 dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Children : NSObject

    @property (nonatomic, strong) NSString *name;
    @property (nonatomic) NSInteger age;

    @property (nonatomic, strong) Children *child;

    @property (nonatomic, strong) NSMutableArray *siblings;
    -(NSUInteger) countOfSiblings;
    -(id)objectInSiblingsAtIndex:(NSUInteger)index;
    -(void)insertObject:(NSString *)object inSiblingsAtIndex:(NSUInteger)index;
    -(void)removeObjectFromSiblingsAtIndex:(NSUInteger)index;

    @property(nonatomic, strong) NSMutableArray *arry;
    -(NSUInteger)countOfArry;
    -(id) objectInArryAtIndex:(NSUInteger)index;
    -(void)insertObject:(NSString *)object inArryAtIndex:(NSUInteger)index;
    -(void)removeObjectFromArryAtIndex:(NSUInteger)index;

@end
