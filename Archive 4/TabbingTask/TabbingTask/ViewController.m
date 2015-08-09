//
//  ViewController.m
//  TabbingTask
//
//  Created by Greens on 6/15/15.
//  Copyright (c) 2015 greens. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    
    IBOutlet UIImageView *imageView;
}
- (IBAction)imagePicker:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)imagePicker:(id)sender {
    UIImagePickerController *imagePick=[[UIImagePickerController alloc]init];
    imagePick.delegate=self;
    [self presentViewController:imagePick animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    imageView.image=[info valueForKey:@"UIImagePickerControllerOriginalImage"];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    NSLog(@"imagePickerController didFinishPickingMediaWithInfo");
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Are you sure want to cancel?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
    [alert show];
    alert.tag=1;
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(alertView.tag==1){
        if(buttonIndex==0){
            [self dismissViewControllerAnimated:YES completion:nil];
        }else{
            NSLog(@"No Cancel");
        }
    }
}



@end
