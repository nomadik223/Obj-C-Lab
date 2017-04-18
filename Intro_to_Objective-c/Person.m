//
//  Person.m
//  Intro_to_Objective-c
//
//  Created by Kent Rogers on 4/17/17.
//  Copyright © 2017 Austin Rogers. All rights reserved.
//

#import "Person.h"

@implementation Person

//NSString *_name; //underlying instance variable
//
//
////Getter
//-(NSString *)name{
//    return _name;
//}
//
////Setter
//-(void)setName:(NSString *)name{
//    _name = name;
//}


-(void)walk{
    
    NSString *name = [self name];
    
//    NSString *austin = @"Austin";
    
    NSLog(@"And %@ would walk 500 miles, and %@ would walk 500 more.", name, name);
}

+(void)sayHello {
    NSLog(@"HEEEEEEY");
}



@end
