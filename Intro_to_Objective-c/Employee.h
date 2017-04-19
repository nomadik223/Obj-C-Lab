//
//  Employee.h
//  Intro_to_Objective-c
//
//  Created by Kent Rogers on 4/18/17.
//  Copyright © 2017 Austin Rogers. All rights reserved.
//

#import "Person.h"

@interface Employee : Person <NSCopying>

@property(strong, nonatomic) NSString *email;

-(instancetype)initWithFirstName:(NSString *)firstName
                        lastName:(NSString *)lastName
                             age:(NSNumber *)age
                           email:(NSString *)email
                   yearsEmployed:(NSNumber *)yearsEmployed
                      andManager:(NSString *)managerName;

//Getter stuffs
-(NSNumber *)employeeNumber;

-(NSNumber *)yearsEmployed;

-(NSString *)managerName;

//Setter stuffs
-(void)setEmployeeNumber:(NSNumber *)employeeNumber;

-(void)setYearsEmployed:(NSNumber *)yearsEmployed;

-(void)setManagerName:(NSString *)managerName;

@end
