//
//  ViewController.m
//  GeekyLemon
//
//  Created by Green on 7/8/15.
//  Copyright (c) 2015 Greens. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
[_mySlider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    _mySlider.minimumValue = 100.0;
    _mySlider.maximumValue = 600.0;
    _mySlider.continuous = YES;
   imageview=[[UIImageView alloc]initWithFrame:CGRectMake(50, 400, 150, 150)];
    imageview.image=[UIImage imageNamed:@"barcelona.jpeg"];
    [self.view addSubview:imageview];
    imageview_one=[[UIImageView alloc]initWithFrame:CGRectMake(50, 50, 150, 150)];
//    imageview_one.image=[UIImage imageNamed:@"barcelona.jpeg"];+
    imageview_one.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:
                                              [NSURL URLWithString:@"https://pbs.twimg.com/profile_images/558109954561679360/j1f9DiJi.jpeg"]]];
    [self.view addSubview:imageview_one];
                    
    // Do any additional setup after loading the view, typically from a nib.
    
moveObjectTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveObject) userInfo:nil repeats:YES];
}

-(void) moveObject {
    imageview_one.center = CGPointMake(imageview_one.center.x, imageview_one.center.y +5);
}
- (IBAction)sliderAction:(id)sender{
    UISlider *MYslider = (UISlider *)sender;
    int SliderValue = (int)roundf(MYslider.value);
//    _changeFont.font = [UIFont systemFontOfSize:SliderValue];
     [imageview setFrame:CGRectMake(50,400,SliderValue,SliderValue)];
    imageview.alpha=SliderValue;
    _myLabel.text = [NSString stringWithFormat:@"%d", SliderValue];
    if([_myLabel.text intValue]>200){
        _showAlert.text=@"Medium";
         }
    if([_myLabel.text intValue]>400){
                     _showAlert.text=@"Literally High";
    }
    if([_myLabel.text intValue]>500){
               _showAlert.text=@"Very High";
    }}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//not working
- (IBAction)AlertButton{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"The Title"
                          message:@"The Message"
                          delegate:self
                          cancelButtonTitle:@"Dismiss"
                          otherButtonTitles:nil];
    alert.transform = CGAffineTransformIdentity;
    alert.transform = CGAffineTransformTranslate(alert.transform, 0.0, 500.0);
    [alert show];
}

-(IBAction)fade {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:2.0];
    [_myLabel setAlpha:0];
    [_changeFont setAlpha:0];
    [imageview setAlpha:0];
    [UIView commitAnimations];
}
@end
