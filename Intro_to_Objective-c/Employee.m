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

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    
    if (self) {
        
        self.firstName = [aDecoder decodeObjectForKey:@"firstName"];
        self.lastName = [aDecoder decodeObjectForKey:@"lastName"];
        self.age = [aDecoder decodeObjectForKey:@"age"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        
        self.yearsEmployed = [aDecoder decodeObjectForKey:@"yearsEmployed"];
        self.managerName = [aDecoder decodeObjectForKey:@"managerName"];
        self.employeeNumber = [aDecoder decodeObjectForKey:@"employeeNumber"];
        
    }
    
    return self;
    
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.firstName forKey:@"firstName"];
    [aCoder encodeObject:self.lastName forKey:@"lastName"];
    [aCoder encodeObject:self.age forKey:@"age"];
    [aCoder encodeObject:self.email forKey:@"email"];
    
    [aCoder encodeObject:self.yearsEmployed forKey:@"yearsEmployed"];
    [aCoder encodeObject:self.managerName forKey:@"managerName"];
    [aCoder encodeObject:self.employeeNumber forKey:@"employeeNumber"];
    
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
