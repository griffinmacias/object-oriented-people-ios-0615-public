//
//  Person.m
//  ObjectOrientedPeople
//
//  Created by Mason Macias on 4/20/15.
//  Copyright (c) 2015 al-tyus.com. All rights reserved.
//

#import "Person.h"
@implementation Person

#define ARC4RANDOM_MAX 0x100000000
- (CGFloat)randomFloatBetweenNumber:(CGFloat)minRange andNumber:(CGFloat)maxRange
{
    return ((float)arc4random() / ARC4RANDOM_MAX)
    * (maxRange - minRange)
    + minRange;
}


- (instancetype)init
{
   
    return [self initWithName:@""];
    
    
}


- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    
    if (self) {
        
        _name = name;
        _height = @9;
        _friends = [NSMutableArray array];
        
    }
    return self;
    
    
    

    
}

- (NSNumber *)grow
{
    /*
     If it's a girl with age < 11 grow between 0 and 1 inch, age >= 11 and <=15 grow .5 to 2 inches. >15 grow 0 inches
     */
    if (self.isFemale) {
        if (self.age.integerValue < 11)
        {
        NSNumber *growth = @(self.height.floatValue + [self randomFloatBetweenNumber:0 andNumber:1]);
            
            return growth;
        }
        else if (self.age.integerValue <= 15)
        {
          NSNumber *growth = @(self.height.floatValue + [self randomFloatBetweenNumber:0.5 andNumber:2]);
            
            return growth;
        }
    }
        /*
         If it's a boy with age < 12 grow between 0 and 1 inch, age >=12 and <=16 grow .5-3.5 inches. >16 grow 0 inches
         
         */
        
        if (!self.isFemale) {
            if (self.age.integerValue < 12) {
                NSNumber *growth = @(self.height.floatValue + [self randomFloatBetweenNumber:0 andNumber:1]);
                
                return growth;
            } else if (self.age.integerValue <= 16)
            {
                NSNumber *growth = @(self.height.floatValue + [self randomFloatBetweenNumber:0.5 andNumber:3.5]);
                
                return growth;
            }
        }
    
    return self.height;
}

- (void)addFriends:(NSArray *)friends
{
/*
 Add the elements of the passed in NSArray to our friends property.
 
 */
    
    for (NSString *friend in friends) {
        [self.friends addObject:friend];
    }
    
    
}


- (NSString *)generatePartyList
{
    NSMutableString *partyList = [[NSMutableString alloc] init];
    for (Person *friend in self.friends){
        if ([self.friends.lastObject isEqual:friend]) {
            [partyList appendFormat:@"%@", friend.name];
        } else
        {
                [partyList appendFormat:@"%@, ", friend.name];
        }
    }
 
    
    return partyList;
    
}
- (BOOL)removeFriend: (Person *)friend
{
    if ([self.friends containsObject:friend]) {
        [self.friends removeObject:friend];
        return YES;
    } else {
        return NO;
    }
}

- (NSArray *)removeFriends: (NSArray *)friends
{
    NSMutableArray *removedFriends = [NSMutableArray array];
    for (NSString *removeFriend in friends) {
        if ([self.friends containsObject:removeFriend]) {
            [self.friends removeObject:removeFriend];
            [removedFriends addObject:removeFriend];
        }
    }
    
    
    return removedFriends;
    
    
    
    
}





















@end
