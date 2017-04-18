//
//  ViewController.m
//  Intro_to_Objective-c
//
//  Created by Kent Rogers on 4/17/17.
//  Copyright © 2017 Austin Rogers. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerDataSource.h"
#import "Person.h"

static int gMoveNumber = 10;

@interface ViewController () <ViewControllerDataSource>

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *nomad = [[Person alloc] init];
    
    [nomad setName:@"Nomadic"];
    
    [nomad walk];
    
    [Person sayHello];
    
    NSLog(@"%i", gMoveNumber);
}

-(void)requiredNumberForEachItem:(int)number{
    
}

@end
