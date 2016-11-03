//
//  main.m
//  Threelow
//
//  Created by Jenny Nguyen on 2016-11-02.
//  Copyright © 2016 LightHouseLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Dice.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        InputCollector *inputCollector = [InputCollector new];
        
        GameController *gameController = [GameController new];
        
        BOOL repeat = YES;
        
        while (repeat) {
            
            NSString *cmd = [inputCollector inputForPrompt:@"roll, reset or quit?"];
            
            if ([cmd isEqualToString:@"quit"]) {
                repeat = NO;
                NSLog(@"GG!");
            } else if ([cmd isEqualToString:@"roll"]) {
                [gameController roll];
                
                BOOL invalidIndex = NO;
                
                do {
                    NSArray *hold = [[inputCollector inputForPrompt:@"Dice to hold/unhold: "] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                    
                    for (NSString *index in hold) {
                        int i =  [index intValue]; // TODO: Use NSNumberFormatter to check for non-numeric values
                        if (i < [gameController.dice count]) {
                            [gameController holdDie:gameController.dice[i]];
                            invalidIndex = NO;
                        } else {
                            NSLog(@"You have to choose an index between 0-4:");
                            invalidIndex = YES;
                            break;
                        }
                    }
                } while (invalidIndex);
                
            } else if ([cmd isEqualToString:@"reset"]) {
                
                [gameController resetDice];
                
            } else if ([cmd isEqualToString:@"score"]) {
                
                NSLog(@"Score: %d", [gameController score]);
                
            } else {
                NSLog(@"Not a valid input");
            }
        }
    }
    
        return 0;
       }
        