//
//  ViewController.m
//  Intro_to_Objective-c
//
//  Created by Kent Rogers on 4/17/17.
//  Copyright © 2017 Austin Rogers. All rights reserved.
//

#import "ViewController.h"
#import "NSString+String.h"
#import "EmployeeDatabase.h"
#import "Employee.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[EmployeeDatabase shared] allEmployees];
    
    Employee *original = [[Employee alloc]initWithFirstName:@"Austin" lastName:@"Rogers" age:@20 email:@"contactALRogers@gmail.com" yearsEmployed:@1 andManager:@"Katherine"];
    
    [[EmployeeDatabase shared] add: original];
    
    Employee *newInstructor = [original copy];
    
    newInstructor.firstName = @"Test";
    
    NSLog(@"%@", original.firstName);
    
    NSString *sampleString = @"Random crits are fair and balanced.";
    
    NSArray *sampleArray = [sampleString toArray];
    NSLog(@"%@", sampleArray);
    [sampleString reversedString];
    
}


@end
