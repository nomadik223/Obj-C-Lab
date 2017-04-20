//
//  AddEmployeeViewController.m
//  Intro_to_Objective-c
//
//  Created by Kent Rogers on 4/20/17.
//  Copyright © 2017 Austin Rogers. All rights reserved.
//

#import "AddEmployeeViewController.h"
#import "Employee.h"
#import "EmployeeDatabase.h"

@interface AddEmployeeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *managerNameField;
@property (weak, nonatomic) IBOutlet UITextField *yearsEmployedField;

@end

@implementation AddEmployeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)saveNewEmployee:(id)sender {
    Employee *newEmployee = [[Employee alloc]initWithFirstName:[_firstNameField text]
                                                      lastName:[_lastNameField text]
                                                           age:[NSNumber numberWithInt:(int)[_ageField text]]
                                                         email:[_emailField text]
                                                 yearsEmployed:[NSNumber numberWithInt:(int)[_yearsEmployedField text]]
                                                    andManager:[_managerNameField text]];
    [[EmployeeDatabase shared] add:newEmployee];
    [self dismissViewControllerAnimated:YES completion:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:self];
}
- (IBAction)cancelNewEmployee:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
