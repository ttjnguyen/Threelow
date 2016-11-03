
//
//  Dice.m
//  Threelow
//
//  Created by Jenny Nguyen on 2016-11-02.
//  Copyright © 2016 LightHouseLabs. All rights reserved.
//

#import "Dice.h"

@implementation Dice

-(int)randomValue {
    int random = 1 + arc4random_uniform(6);
    self.currentValue = random;
    return random;
}

@end
