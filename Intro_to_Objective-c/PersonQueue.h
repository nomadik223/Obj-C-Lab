//
//  PersonQueue.h
//  Intro_to_Objective-c
//
//  Created by Kent Rogers on 4/18/17.
//  Copyright © 2017 Austin Rogers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@protocol PersonQueue <Person>

@optional
-(int)count;

@required
-(void)enqueue:(Person *)person;

-(Person *)dequeue;

@end
