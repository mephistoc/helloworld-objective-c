//
//  HWTableViewController.m
//  helloworld-objective-c
//
//  Created by CHENHSIN-PANG on 2015/3/24.
//  Copyright (c) 2015年 CinnamonRoll. All rights reserved.
//

#import "HWTableViewController.h"

@interface HWTableViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, weak)UITableView   *tableView;

@end

@implementation HWTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    tableView.dataSource = self; // 需要在上面宣告這個class有實作 UITableViewDataSource
    tableView.delegate = self;
    
    self.tableView = tableView; // 把local variable設給這個物件的property，是方便存取。
    
    
}


// 當程式執行到這裡，self.view拿到的大小才正確
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.tableView.frame = self.view.bounds; // 可以查一下frame 與 bounds的差別
    

}


#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4; // 有幾個Section
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 每個Section有幾個Row
    
    if(section == 0) return 3;
    if(section == 1) return 4;
    if(section == 2) return 5;
    
    return 2;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DataCell"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"DataCell"];
    }
    
    
    cell.textLabel.text = @"Hello World";
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];

    
    return cell;
}

// 上面三個是資料基本的DataSource
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Section %d", section];
}



#pragma mark - UITableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Click Section = %d Row = %d", indexPath.section, indexPath.row);
}




@end
