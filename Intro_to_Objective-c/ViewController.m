//
//  ViewController.m
//  Intro_to_Objective-c
//
//  Created by Kent Rogers on 4/17/17.
//  Copyright © 2017 Austin Rogers. All rights reserved.
//

#import "ViewController.h"
#import "NSString+String.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *sampleString = @"Ain't no rest for the wicked.";
    
    NSArray *sampleArray = [sampleString toArray];
    NSLog(@"%@", sampleArray);
    [sampleString reversedString];
    
}


@end
