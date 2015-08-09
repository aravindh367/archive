//
//  ViewController.h
//  GeekyLemon
//
//  Created by Green on 7/8/15.
//  Copyright (c) 2015 Greens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UIImageView* imageview;
    UIImageView* imageview_one;
    NSTimer *moveObjectTimer;
    
}
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UILabel *showAlert;
@property (weak, nonatomic) IBOutlet UILabel *changeFont;

- (IBAction)AlertButton;
- (IBAction)sliderValueChanged:(UISlider *)sender;
-(IBAction)fade;
@end

