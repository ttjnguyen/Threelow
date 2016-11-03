//
//  GameController.h
//  Threelow
//
//  Created by Jenny Nguyen on 2016-11-02.
//  Copyright © 2016 LightHouseLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Dice;

@interface GameController : NSObject

//@property (nonatomic, strong) NSMutableArray *numbersRolled;
//@property (nonatomic, strong) NSMutableArray *numbersHeld;

//-(void)holdDie:(NSNumber *)heldNumber;

//-(void)unHoldDie:(NSNumber *)dieNumber;

//-(void)resetDice;

//-(NSInteger)score;


@property (nonatomic) NSMutableArray *dice;
@property (nonatomic) NSMutableSet *held;
@property (nonatomic, assign) int numberOfRolls;

-(instancetype)init;

-(void)roll;
-(void)holdDie:(Dice *)dice;
-(void)resetDice;
-(int)score;










@end
