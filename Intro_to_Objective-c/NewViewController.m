//
//  NewViewController.m
//  Intro_to_Objective-c
//
//  Created by Kent Rogers on 4/19/17.
//  Copyright © 2017 Austin Rogers. All rights reserved.
//

#import "NewViewController.h"
#import "EmployeeDatabase.h"

@interface NewViewController () <UITableViewDelegate,UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong,nonatomic) NSMutableArray *allEmployees;

@end

@implementation NewViewController

- (void)viewDidLoad {
    
    if ([_allEmployees count] == 0) {
        _allEmployees = [[NSMutableArray alloc]init];
    }
    [super viewDidLoad];
    
    Employee *original = [[Employee alloc]initWithFirstName:@"Zant" lastName:@"Varentine" age:@30 email:@"godslayer66@gmail.com" yearsEmployed:@44 andManager:@"Belfrost"];
    
    [[EmployeeDatabase shared] add: original];
    [[EmployeeDatabase shared] add: original];
    [[EmployeeDatabase shared] add: original];
    
    self.table.delegate = self;
    self.table.dataSource = self;
    
    [_allEmployees addObjectsFromArray:[[EmployeeDatabase shared] allEmployees]];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [_allEmployees[indexPath.row] firstName];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.allEmployees.count;
}

@end
