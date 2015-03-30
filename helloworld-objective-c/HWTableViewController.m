//
//  HWTableViewController.m
//  helloworld-objective-c
//
//  Created by CHENHSIN-PANG on 2015/3/24.
//  Copyright (c) 2015年 CinnamonRoll. All rights reserved.
//

#import "HWTableViewController.h"

@interface HWTableViewController ()<UITableViewDataSource, UITableViewDelegate>
//Method which provide fake data for test.
-(NSString*)getFakeWaterData;

@property(nonatomic, weak)UITableView   *tableView;

@end
static NSArray *waterArray;
@implementation HWTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    tableView.dataSource = self; // 需要在上面宣告這個class有實作 UITableViewDataSource
    tableView.delegate = self;
    
    self.tableView = tableView; // 把local variable設給這個物件的property，是方便存取。
    
    // Convert JSON data into a NSDictionary object.
    NSString *waterRaw = [self getFakeWaterData];
    NSData *waterData = [waterRaw dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *waters = [NSJSONSerialization JSONObjectWithData:waterData options:0 error:nil];
    waterArray = [waters valueForKey:@"data"];
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

    cell.backgroundColor = (indexPath.row%2)?[UIColor lightGrayColor]:[UIColor grayColor];
    // Get string in the waters dictionary object.
    NSDictionary *dam = [waterArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [dam valueForKey:@"reservoirName"];

    if(indexPath.row%2)
    {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    }else
    {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    }

    
    return cell;
}

// 上面三個是資料基本的DataSource
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Section %ld", (long)section];
}



#pragma mark - UITableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Click Section = %ld Row = %ld", (long)indexPath.section, (long)indexPath.row);
}

-(NSString*)getFakeWaterData
{
    NSString *rtnString = @"{"
    "    \"data\": [{"
    //NSString *rtnString = @"{"
    "    \"reservoirName\": \"石門水庫\","
    "    \"baseAvailable\": \"20,123.60\","
    "    \"daliyTime\": \"起:2015-03-29(0時)迄:2015-03-30(0時)\","
    "    \"daliyRainfall\": \"0.00\","
    "    \"daliyInflow\": \"175.13\","
    "    \"daliyOverflow\": \"68.77\","
    "    \"daliyDetector\": \"0.29\","
    "    \"concentration\": \"--\","
    "    \"immediateTime\": \"2015-03-29(23時)\","
    "    \"immediateLevel\": \"219.95\","
    "    \"immediateStorage\": \"4,974.60\","
    "    \"immediatePercentage\": \"24.72%\","
    "    \"lastedUpdateTime\": \"2015-03-30 02:00:01\""
    "  }, {"
    "    \"reservoirName\": \"新山水庫\","
    "    \"baseAvailable\": \"1,002.00\","
    "    \"daliyTime\": \"起:2015-03-29(0時)迄:2015-03-30(0時)\","
    "    \"daliyRainfall\": \"0.00\","
    "    \"daliyInflow\": \"0.00\","
    "    \"daliyOverflow\": \"0.92\","
    "    \"daliyDetector\": \"--\","
    "    \"concentration\": \"--\","
    "    \"immediateTime\": \"2015-03-29(8時)\","
    "    \"immediateLevel\": \"82.94\","
    "    \"immediateStorage\": \"825.24\","
    "    \"immediatePercentage\": \"82.36%\","
    "    \"lastedUpdateTime\": \"2015-03-30 02:00:01\""
    "  }, {"
    "    \"reservoirName\": \"翡翠水庫\","
    "    \"baseAvailable\": \"33,550.50\","
    "    \"daliyTime\": \"起:2015-03-29(0時)迄:2015-03-30(0時)\","
    "    \"daliyRainfall\": \"0.00\","
    "    \"daliyInflow\": \"201.60\","
    "    \"daliyOverflow\": \"0.00\","
    "    \"daliyDetector\": \"0.29\","
    "    \"concentration\": \"--\","
    "    \"immediateTime\": \"2015-03-29(23時)\","
    "    \"immediateLevel\": \"165.92\","
    "    \"immediateStorage\": \"29,833.24\","
    "    \"immediatePercentage\": \"88.92%\","
    "    \"lastedUpdateTime\": \"2015-03-30 02:00:01\""
    "  }, {"
    "    \"reservoirName\": \"寶山水庫\","
    "    \"baseAvailable\": \"538.00\","
    "    \"daliyTime\": \"起:2015-03-29(0時)迄:2015-03-30(0時)\","
    "    \"daliyRainfall\": \"0.00\","
    "    \"daliyInflow\": \"8.64\","
    "    \"daliyOverflow\": \"4.96\","
    "    \"daliyDetector\": \"--\","
    "    \"concentration\": \"--\","
    "    \"immediateTime\": \"2015-03-29(7時)\","
    "    \"immediateLevel\": \"135.53\","
    "    \"immediateStorage\": \"220.70\","
    "    \"immediatePercentage\": \"41.02%\","
    "    \"lastedUpdateTime\": \"2015-03-30 02:00:01\""
    //“  }";
    " }]"
    "}";
    return rtnString;
}


@end
