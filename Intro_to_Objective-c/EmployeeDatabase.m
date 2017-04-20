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

-(instancetype)init{
    self = [super init];
    
    if (self) {
        
        _employees = [NSKeyedUnarchiver unarchiveObjectWithData:[NSData dataWithContentsOfURL:self.archiveURL]];
        
        if (!_employees) {
            _employees = [[NSMutableArray alloc]init];
        }
    
    }
    return self;
}

-(void)save{
    
    BOOL success = [NSKeyedArchiver archiveRootObject:self.employees toFile:self.archiveURL.path];
    
    if (success) {
        NSLog(@"Saved employees");
    } else {
        NSLog(@"Save failed. Try again later. Or not at all; I'm a computer log not your boss.");
    }
    
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
    [self save];
}

-(void)remove:(Employee *)employee{
    [_employees removeObject:employee];
    [self save];
}

-(void)removeEmployeeAtIndex:(int)index{
    [_employees removeObjectAtIndex:index];
    [self save];
}


-(void)removeAllEmployees{
    [_employees removeAllObjects];
    [self save];
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
