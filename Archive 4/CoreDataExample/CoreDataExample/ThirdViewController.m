//
//  ThirdViewController.m
//  CoreDataExample
//
//  Created by Green on 7/9/15.
//  Copyright (c) 2015 Greens. All rights reserved.
//

#import "ThirdViewController.h"
#import "AppDelegate.h"
#import "Student.h"

@interface ThirdViewController ()
{
    
    AppDelegate *appDelegate;
    NSFetchRequest *fetchRequest;
    Student  *stud ;
}
@end

@implementation ThirdViewController
@synthesize language,array_three;
@synthesize mangedobjectContext_three;

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    appDelegate =   (AppDelegate *) [[UIApplication sharedApplication]delegate];
//    mangedobjectContext_three   = appDelegate.managedObjectContext;
    
    
//    
//    
//    fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Student"];
//    array_three = [mangedobjectContext_three executeFetchRequest:fetchRequest error:nil];
//    // Do any additional setup after loading the view.
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name==%@",
//                              language];
//    [fetchRequest setPredicate:predicate];
//    NSArray *array_four= [mangedobjectContext_three executeFetchRequest:fetchRequest error:nil];
//    
//    
//    NSLog(@"Fetch  age Array 1%@",[array_four valueForKey:@"lang"]);
    langLabel.text=language;
    NSLog(@"%@",language);
    NSLog(@"Third View-->%@",array_three);
    NSLog(@"Fetch  age%@",[array_three valueForKey:@"age"]);
    NSLog(@"Fetch name%@",[array_three valueForKey:@"name"]);
    NSLog(@"Fetch lang%@",[array_three valueForKey:@"lang"]);
    
//    UIButton *dynamicButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    dynamicButton.frame  = CGRectMake(50, 50, 150, 50);
//    [dynamicButton setTitle:@"test button" forState:UIControlStateNormal];
//    [dynamicButton setTitle:@"test_one button" forState:UIControlStateHighlighted];
//    [dynamicButton setBackgroundColor:[UIColor redColor]];
//    [dynamicButton addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:dynamicButton];
//
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
