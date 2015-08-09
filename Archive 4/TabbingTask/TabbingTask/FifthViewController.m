//
//  FifthViewController.m
//  TabbingTask
//
//  Created by Greens on 6/17/15.
//  Copyright (c) 2015 greens. All rights reserved.
//

#import "FifthViewController.h"
#import "ThirdViewController.h"

@interface FifthViewController ()
{
    NSArray *array;
    NSArray *array_one;
}
@end

@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    array=[[NSArray alloc]initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F", nil];
 array_one=[[NSArray alloc]initWithObjects:@"A1",@"B1",@"C1",@"D1",@"E1",@"F1", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [array count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}
// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if(indexPath.section==0){
        cell.textLabel.text=[array objectAtIndex:indexPath.row];
    }else{
        cell.textLabel.text=[array_one objectAtIndex:indexPath.row];
    }
    return  cell;
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if(section==0){
        return  @"Team 1";
    }else{
        return  @"Team 2";
    }
    
}// fixed font style. use custom view (UILabel) if you want something different
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if(section==0){
        return  @"Team 1 End";
    }else{
        return  @"Team 2 End";
    }

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:[array objectAtIndex:indexPath.row] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Go", nil];
    [alert show];
    }else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:[array_one objectAtIndex:indexPath.row] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Go", nil];
        [alert show];

    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==0){
        NSLog(@"Do Nothing");
    }else{
        ThirdViewController *third=[self.storyboard instantiateViewControllerWithIdentifier:@"third"];
        [[self navigationController]pushViewController:third animated:YES];
        
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
