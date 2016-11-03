//
//  GameController.m
//  Threelow
//
//  Created by Jenny Nguyen on 2016-11-02.
//  Copyright © 2016 LightHouseLabs. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"

@implementation GameController

-(instancetype)init {
    self = [super init];
    
    if (self) {
        self.dice = [NSMutableArray new];
        self.held = [NSMutableSet new];
        self.numberOfRolls = 0;
    }
    
    return self;
}

-(void)roll{
    
    if (self.numberOfRolls != 5) {
        self.numberOfRolls++;
        
        [self.dice removeAllObjects];
        
        for (Dice *dice in self.held) {
            [self.dice addObject:dice];
        }
        
        for (int i = 0; i < 5 - self.held.count; i++) {
            Dice *singleDice = [Dice new];
            [singleDice randomValue];
            [self.dice addObject:singleDice];
        }
    } else {
        NSLog(@"You must reset after 5 rolls.");
    }
    NSLog(@"%@", self);
}

-(void)holdDie:(Dice *)dice {
    if ([self.held containsObject:dice]) {
        [self.held removeObject:dice];
    } else {
        [self.held addObject:dice];
    }
    
    NSLog(@"%@", self);
}

-(void)resetDice {
    [self.held removeAllObjects];
    self.numberOfRolls = 0;
}

-(int)score {
    int score = 0;
    for (Dice *dice in self.held) {
        if (dice.currentValue != 3) {
            score += dice.currentValue;
        }
    }
    
    return score;
}

- (NSString *)description {
    NSString *description = [NSString stringWithFormat:@"Number of rolls: %d\n", self.numberOfRolls];
    
    for (Dice *dice in self.dice) {
        if ([self.held containsObject:dice]) {
            description = [description stringByAppendingString:[NSString stringWithFormat:@"[%d]\n", dice.currentValue]];
        } else {
            description = [description stringByAppendingString:[NSString stringWithFormat:@"%d\n", dice.currentValue]];
        }
    }
    
    description = [description stringByAppendingString:[NSString stringWithFormat:@"Score: %d\n", [self score]]];
    
    return description;
}






@end

