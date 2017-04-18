//
//  ViewControllerDataSource.h
//  Intro_to_Objective-c
//
//  Created by Kent Rogers on 4/17/17.
//  Copyright © 2017 Austin Rogers. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ViewControllerDataSource <NSObject>

@optional
-(void)numberOfItems:(int)number;

@required
-(void)requiredNumberForEachItem:(int)number;

@end
