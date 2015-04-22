//
//  Person.m
//  ObjectOrientedPeople
//
//  Created by Mason Macias on 4/20/15.
//  Copyright (c) 2015 al-tyus.com. All rights reserved.
//

#import "Person.h"
@implementation Person

-(id)initWithName:(NSString *)name
{
    if (self = [super init]) {
        _name = name;
        _height = @9;
    }
    return self;
}

-(id)init
{
    return [self initWithName:@""];
}

#define ARC4RANDOM_MAX 0x100000000
- (CGFloat)randomFloatBetweenNumber:(CGFloat)minRange andNumber:(CGFloat)maxRange
{
    return ((float)arc4random() / ARC4RANDOM_MAX)
    * (maxRange - minRange)
    + minRange;
}

- (NSNumber *)grow
{
    CGFloat height;
    if (self.isFemale)
    {
        if ([self.age intValue] < 11)
        {
            height = [self randomFloatBetweenNumber:0 andNumber:1];
        }
        else if
            ([self.age intValue] >= 11 && [self.age intValue] <= 15)
        {
            height = [self randomFloatBetweenNumber:.5 andNumber:2];
        }
    else if
            ([self.age intValue] > 15)
        {
            height = 0;
        }
        } else {
            
            
            if ([self.age intValue] < 12)
            {
                height = [self randomFloatBetweenNumber:0 andNumber:1];
            }
            else if
                ([self.age intValue] >= 12 && [self.age intValue] <= 16)
                
            {
                    height = [self randomFloatBetweenNumber:.5 andNumber:3.5];
                }
            else if
                    
                    ([self.age intValue] > 16)
                {
                    height = 0;
                }
        }
    return [NSNumber numberWithFloat:([self.height floatValue] + height)];
}

- (void)addFriends:(NSArray *)friends
{
    [self.friends addObjectsFromArray:friends];
       
    }

- (NSString *)generatePartyList
{
    NSMutableArray *friendsList = [[NSMutableArray alloc] init];
    for (Person *friend in self.friends) {
        [friendsList addObject:[NSString stringWithFormat:@"%@", friend.name]];
    }
    
    return [friendsList componentsJoinedByString:@", "];
}
- (BOOL)removeFriend: (Person *)friend
         {
             NSUInteger remover = [self.friends indexOfObject:friend];
             if (remover == NSNotFound)
             {
                 return  NO;
             } else {
                 [self.friends removeObjectAtIndex:remover];
                 return YES;
             }
         }
- (NSArray *)removeFriends: (NSArray *)friends
{
    NSMutableArray *removedFrz = [[NSMutableArray alloc] init];
    for (Person *friend in friends) {
       
        if ([self removeFriend:friend])
        {
            [removedFrz addObject:friend];
        }
    }
    return removedFrz;
}

@end
