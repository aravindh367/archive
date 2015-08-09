//
//  SecondViewController.m
//  GeekyLemon
//
//  Created by Green on 7/8/15.
//  Copyright (c) 2015 Greens. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)TextfieldMove:(id)sender {
    CGRect frame1 = Imageview.frame;
    CGRect frame2 = Textfield.frame;
    frame1.origin.y = 100;
    frame1.origin.y = -41;
    frame2.origin.y = 20;
    frame2.origin.y = 206;
    [UIView beginAnimations:Nil context:Nil];
    [UIView setAnimationDuration:0.7];
    Imageview.frame = frame1;
    Textfield.frame = frame2;
    [UIView commitAnimations];
}

-(IBAction)DismissKeyboard:(id)sender {
    [sender resignFirstResponder];
    CGRect frame1 = Imageview.frame;
    CGRect frame2 = Textfield.frame;
    frame1.origin.y = 100;
    frame1.origin.y = 20;
    frame2.origin.y = 20;
    frame2.origin.y = 315;
    [UIView beginAnimations:Nil context:Nil];
    [UIView setAnimationDuration:0.7];
    Imageview.frame = frame1;
    Textfield.frame = frame2;
    [UIView commitAnimations];
}

- (IBAction)switchBack:(id)sender {
    ThirdViewController *third=[self.storyboard instantiateViewControllerWithIdentifier:@"third"];
    third.modalTransitionStyle =UIModalTransitionStylePartialCurl;
    [self presentModalViewController:third animated:YES];
//    [[self navigationController]pushViewController:third animated:YES];
    /*
     
     second.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
     second.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
     second.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
     second.modalTransitionStyle = UIModalTransitionStylePartialCurl;
     */
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
