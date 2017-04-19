//
//  EmployeeDatabase.m
//  Intro_to_Objective-c
//
//  Created by Kent Rogers on 4/18/17.
//  Copyright © 2017 Austin Rogers. All rights reserved.
//

#import "EmployeeDatabase.h"

@interface EmployeeDatabase ()

@property(strong, nonatomic) NSMutableArray *employees;

@end

@implementation EmployeeDatabase

+(instancetype)shared {
    
    static EmployeeDatabase *shared = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[[self class] alloc]init];
    });
    
    return shared;
    
}

-(NSInteger)count {
    return [_employees count];
}

-(NSArray *)allEmployees{
    return _employees;
}

-(Employee *)employeeAtIndex:(int)index{
    return _employees[index];
}


-(void)add:(Employee *)employee{
    if ([_employees count] == 0) {
        _employees = [[NSMutableArray alloc]init];
    }
    [_employees addObject:employee];
}

-(void)remove:(Employee *)employee{
    [_employees removeObject:employee];
}

-(void)removeEmployeeAtIndex:(int)index{
    [_employees removeObjectAtIndex:index];
}


-(void)removeAllEmployees{
    [_employees removeAllObjects];
}

//MARK: Helper methods
-(NSURL *)documentsDirectory{
    
    NSURL *documentsDirectoryURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    
    return documentsDirectoryURL;
    
}

-(NSURL *)archiveURL{
    return [[self documentsDirectory] URLByAppendingPathComponent:@"archive"];
}

@end
