//
//  NSString+String.m
//  Intro_to_Objective-c
//
//  Created by Kent Rogers on 4/18/17.
//  Copyright © 2017 Austin Rogers. All rights reserved.
//

#import "NSString+String.h"

@implementation NSString (String)

-(NSArray *)toArray{
    return [self componentsSeparatedByString:@" "];
}

-(NSString *)reversedString{
    NSMutableString *reversedString = [NSMutableString string];
    NSInteger charIndex = [self length];
    while (charIndex > 0) {
        charIndex--;
        NSRange subStrRange = NSMakeRange(charIndex, 1);
        [reversedString appendString:[self substringWithRange:subStrRange]];
    }
    
    NSLog(@"%@", reversedString);
    return reversedString;
}

@end
