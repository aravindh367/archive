//
//  ViewController.m
//  CoreDataExample
//
//  Created by Green on 7/9/15.
//  Copyright (c) 2015 Greens. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Student.h"
#import "SecondViewController.h"
@interface ViewController ()
{
    AppDelegate *appDelegate;
    NSFetchRequest *fetchRequest;
    NSArray  *array;
    Student  *stud ;
    NSArray *array_two;
}
@end

@implementation ViewController
@synthesize mangedobjectContext    ;
- (void)viewDidLoad {
    
    appDelegate =   (AppDelegate *) [[UIApplication sharedApplication]delegate];
    mangedobjectContext   = appDelegate.managedObjectContext;
    
    
    
   
    fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Student"];
    array = [mangedobjectContext executeFetchRequest:fetchRequest error:nil];

    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveAction:(id)sender {
    Student  *stud  =   [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:mangedobjectContext];
    stud.name  = name.text;
    NSNumberFormatter * myNumFormatter = [[NSNumberFormatter alloc] init];
 NSNumber *tempNum = [myNumFormatter numberFromString:age.text];
    
    stud.age  = tempNum;
    stud.lang=lang.text;
    
    NSError *error;
    
    if([mangedobjectContext save:&error])
    {
        NSLog(@"Saved Suucesssfully");
    }
    else
    {
        NSLog(@"Saved  unsuccess");
    }
    
    

    
}


- (IBAction)showAction:(id)sender {
    fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Student"];
    array = [mangedobjectContext executeFetchRequest:fetchRequest error:nil];
    NSLog(@"%@",array);
    NSLog(@"%@",[[array valueForKey:@"name"]objectAtIndex:1]);
    NSLog(@"%@",[array valueForKey:@"age"]);
    NSLog(@"%@",[array valueForKey:@"name"]);
    NSLog(@"%@",[array valueForKey:@"lang"]);
}

- (IBAction)predicateAction:(id)sender {
    NSString *langID=@"English";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"lang==%@",
                              langID];
    [fetchRequest setPredicate:predicate];
    NSArray *array_one= [mangedobjectContext executeFetchRequest:fetchRequest error:nil];
    

    NSLog(@"Fetch  age Array 1%@",[array_one valueForKey:@"age"]);
    NSLog(@"Fetch name Array 1%@",[array_one valueForKey:@"name"]);
     NSLog(@"Fetch lang Array 1%@",[array_one valueForKey:@"lang"]);
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
        [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
     array_two= [mangedobjectContext executeFetchRequest:fetchRequest error:nil];
    NSLog(@"Fetch  age%@",[array_two valueForKey:@"age"]);
    NSLog(@"Fetch name%@",[array_two valueForKey:@"name"]);
    NSLog(@"Fetch lang%@",[array_two valueForKey:@"lang"]);
    
}
- (IBAction)nextAction:(id)sender{
    SecondViewController *third=[self.storyboard instantiateViewControllerWithIdentifier:@"second"];
    third.modalTransitionStyle =UIModalTransitionStylePartialCurl;
    third.array_secondView=[array_two copy];
    [self presentModalViewController:third animated:YES];
}
@end
