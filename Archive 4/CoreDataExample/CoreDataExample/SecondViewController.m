//
//  SecondViewController.m
//  CoreDataExample
//
//  Created by Green on 7/9/15.
//  Copyright (c) 2015 Greens. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"
#import "Student.h"
#import "ThirdViewController.h"

@interface SecondViewController ()
{
    AppDelegate *appDelegate;
    NSFetchRequest *fetchRequest;
    NSArray  *array_one;
    Student  *stud ;
}
@end

@implementation SecondViewController
@synthesize mangedobjectContext_one,array_secondView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Print %@",array_secondView);
    appDelegate =   (AppDelegate *) [[UIApplication sharedApplication]delegate];
    mangedobjectContext_one   = appDelegate.managedObjectContext;
    
    
    
    
    fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Student"];
    array_one = [mangedobjectContext_one executeFetchRequest:fetchRequest error:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

{
    return [[array_one valueForKey:@"name"]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.textLabel.text=[[array_one valueForKey:@"name"]objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[[array_one valueForKey:@"lang"]objectAtIndex:indexPath.row];

    return  cell;
    

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Indexpath-->%@",[[array_one valueForKey:@"name"]objectAtIndex:indexPath.row]);
    ThirdViewController *third=[self.storyboard instantiateViewControllerWithIdentifier:@"third"];
    third.modalTransitionStyle =UIModalTransitionStylePartialCurl;
    
    third.language=[[array_one valueForKey:@"name"]objectAtIndex:indexPath.row];
    third.array_three=[array_one copy];
    [self presentModalViewController:third animated:YES];
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
