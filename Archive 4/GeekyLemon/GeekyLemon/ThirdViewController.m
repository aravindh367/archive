//
//  ThirdViewController.m
//  GeekyLemon
//
//  Created by Green on 7/8/15.
//  Copyright (c) 2015 Greens. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *array = [[NSArray alloc] initWithObjects:@"Red",@"Blue",@"Green",@"Yellow",@"Purple", nil];
    self->PickerData = array;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [PickerData count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self->PickerData objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    int select = row;
    if (select == 0) {
        self.view.backgroundColor = [UIColor redColor];
    } else if (select == 1) {
        self.view.backgroundColor = [UIColor blueColor];
    } else if (select == 2) {
        self.view.backgroundColor = [UIColor greenColor];
    }else if (select == 3) {
        self.view.backgroundColor = [UIColor yellowColor];
    }else if (select == 4) {
        self.view.backgroundColor = [UIColor purpleColor];
    }
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
