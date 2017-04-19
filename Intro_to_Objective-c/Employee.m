//
//  Employee.m
//  Intro_to_Objective-c
//
//  Created by Kent Rogers on 4/18/17.
//  Copyright © 2017 Austin Rogers. All rights reserved.
//

#import "Employee.h"

@implementation Employee
NSNumber *_employeeNumber;
NSNumber *_yearsEmployed;
NSString *_managerName;


-(instancetype)initWithFirstName:(NSString *)firstName
                        lastName:(NSString *)lastName
                             age:(NSNumber *)age
                           email:(NSString *)email
                   yearsEmployed:(NSNumber *)yearsEmployed
                      andManager:(NSString *)managerName{
    
    self = [super initWithFirstName:firstName lastName:lastName andAge:age];
    
    if (self){
        _yearsEmployed = yearsEmployed;
        _managerName = managerName;
        _email = email;
        _employeeNumber = [NSNumber numberWithInt:arc4random_uniform(1000)];
    }
    
    return self;
    
}

-(id)copyWithZone:(NSZone *)zone{
    
    Employee *employee = [super copyWithZone:zone];
    
    employee.employeeNumber = self.employeeNumber;
    employee.managerName = self.managerName;
    employee.yearsEmployed = self.yearsEmployed;
    employee.email = self.email;
    
    return employee;
    
}

//Getter
-(NSNumber *)employeeNumber{
    return _employeeNumber;
}

-(NSNumber *)yearsEmployed{
    return _yearsEmployed;
}

-(NSString *)managerName{
    return _managerName;
}

//Setter
-(void)setEmployeeNumber:(NSNumber *)employeeNumber {
    _employeeNumber = employeeNumber;
}

-(void)setYearsEmployed:(NSNumber *)yearsEmployed {
    _yearsEmployed = yearsEmployed;
}

-(void)setManagerName:(NSString *)managerName {
    _managerName = managerName;
}

@end
