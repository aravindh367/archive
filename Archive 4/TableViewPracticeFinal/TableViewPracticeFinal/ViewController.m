//
//  ViewController.m
//  TableViewPracticeFinal
//
//  Created by Greens on 10/07/15.
//  Copyright (c) 2015 greens. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "secondViewController.h"
#import "thirdViewController.h"
#import "ObjectsPassing.h"
#import "SharedData.h"

@interface ViewController ()
{
    NSArray *array;
    NSArray *array1;
    NSArray *array2;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    
    array=[[NSArray alloc]initWithObjects:@"A1",@"A2",@"A3",@"A4",@"A5", nil];
     array1=[[NSArray alloc]initWithObjects:@"A1.jpeg",@"A2.jpeg",@"A3.jpeg",@"A4.jpeg",@"A5.jpeg", nil];
    array2=[[NSArray alloc]initWithObjects:@"This is 1st image",@"This is 2nd image",@"This is 3rd image",@"This is 4th image",@"This is 5th image", nil];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return array.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.labelname.text=[array objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    secondViewController *second;
    thirdViewController *third;
    ObjectsPassing *object;
    
    [SharedData sharedConstants].tempString  = [array objectAtIndex:indexPath.row];
    
//    NSString  *valuepassing_String;
 
        second = [self.storyboard instantiateViewControllerWithIdentifier:@"second"];
        
            second.activestring  = [array objectAtIndex:indexPath.row];
             second.activestring1  = [array1 objectAtIndex:indexPath.row];
//    third.finalString =[array2 objectAtIndex:indexPath.row];
    
    object.objectString =[array2 objectAtIndex:indexPath.row];
        [[self navigationController]pushViewController:second animated:YES];
        
    }




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
