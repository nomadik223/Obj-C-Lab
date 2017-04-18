//
//  Person.h
//  Intro_to_Objective-c
//
//  Created by Kent Rogers on 4/17/17.
//  Copyright © 2017 Austin Rogers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(strong, nonatomic) NSString *firstName, *lastName, *age;
//Name accessor Methods
//-(NSString *)name;
//-(void)setName:(NSString *)name;

//Instance Method
-(void)walk;

//Class Method
+(void)sayHello;


@end
