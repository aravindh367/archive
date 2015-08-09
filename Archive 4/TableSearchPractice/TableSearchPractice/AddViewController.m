//
//  AddViewController.m
//  TableSearchPractice
//
//  Created by Green on 7/5/15.
//  Copyright (c) 2015 Greens. All rights reserved.
//

#import "AddViewController.h"
#import "RecipeBookViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)addTableValue:(id)sender {
    
    RecipeBookViewController *receipe=[self.storyboard instantiateViewControllerWithIdentifier:@"first"];
    [self presentViewController:receipe animated:YES completion:nil];
    [receipe passvalue:addText.text];
}
@end
