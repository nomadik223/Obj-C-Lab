//
//  NewViewController.m
//  Intro_to_Objective-c
//
//  Created by Kent Rogers on 4/19/17.
//  Copyright © 2017 Austin Rogers. All rights reserved.
//

#import "NewViewController.h"
#import "EmployeeDatabase.h"
#import "PointlessThing.h"

static void *kvoContext = &kvoContext;

@interface NewViewController () <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) PointlessThing *pointlessThing;
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation NewViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.table.dataSource = self;
    
    self.pointlessThing = [[PointlessThing alloc]init];
    
    [self setValue:@4417 forKeyPath:@"pointlessThing.pointlessThing"];
    
    NSLog(@"%i", (int)self.pointlessThing.pointlessThing);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadView) name:@"reloadData" object:nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self addObserver:self forKeyPath:@"self.pointlessThing.pointlessThing" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:kvoContext];
    
    [self.pointlessThing incrementPointlessThing];
    
    [self.pointlessThing incrementPointlessThing];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self removeObserver:self forKeyPath:@"self.pointlessThing.pointlessThing"];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    if (context == kvoContext) {
        
        NSLog(@"The completely pointless thing is now: %i. How useful.", (int)self.pointlessThing.pointlessThing);
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
    
}

-(void)reloadView{
    [self.table reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [[[EmployeeDatabase shared] employeeAtIndex:(int)indexPath.row] firstName];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[EmployeeDatabase shared] count];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[EmployeeDatabase shared] removeEmployeeAtIndex:(int)indexPath.row];
        [self.table reloadData];
    }
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return true;
}

@end
