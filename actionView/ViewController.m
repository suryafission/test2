//
//  ViewController.m
//  actionView
//
//  Created by SUBRAHMANYAM NUKALA on 01/04/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tf1,tf2;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnPressed:(id)sender
{
    UIActionSheet *ac = [[UIActionSheet alloc]initWithTitle:@"math" delegate:self cancelButtonTitle:@"do nothing" destructiveButtonTitle:nil otherButtonTitles:@"add",@"diff",@"clear", nil];
    [ac showInView:self.view];
    
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            NSString *Str = [NSString stringWithFormat:@"%i",[tf1.text integerValue]+[tf2.text integerValue]];
            _res.text = Str;
            break;
        }
        case 1:
        {
            NSString *Str = [NSString stringWithFormat:@"%i",[tf1.text integerValue]-[tf2.text integerValue]];
            _res.text = Str;
            break;
        }
        case 2:
        {
            _res.text =@"";
            tf1.text = @"";
            tf2.text = @"";
            break;
        }
        default:
            break;
    }
}
@end
