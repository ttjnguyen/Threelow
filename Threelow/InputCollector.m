//
//  InputCollector.m
//  Threelow
//
//  Created by Jenny Nguyen on 2016-11-02.
//  Copyright © 2016 LightHouseLabs. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

-(NSString *)inputForPrompt:(NSString *)promptString {

NSLog(@"%@", promptString);

char inputChars[255];
scanf("%s", inputChars);

NSString *inputString = [[NSString stringWithUTF8String:inputChars]
stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
return inputString;
}


@end
