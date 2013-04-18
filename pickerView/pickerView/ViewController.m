//
//  ViewController.m
//  pickerView
//
//  Created by SUBRAHMANYAM NUKALA on 19/03/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//
// add something
#import "ViewController.h"

@interface ViewController ()

@end
NSArray *array1;

@implementation ViewController

@synthesize pickerView;
@synthesize myImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    array1=[[NSArray alloc]initWithObjects:@"himym",@"mf",@"got", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [array1 count];
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [array1 objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //UIImage *himym = [UIImage imageNamed:@"himym.jpg"];
    UIImage *mf = [UIImage imageNamed:@"mf.jpg"];
    UIImage *got = [UIImage imageNamed:@"got.jpg"];
    
    
    switch (row) {
        case 0:
        {
            myImage.image=himym;
            //myImage.backgroundColor = [UIColor redColor];
            break;
        }
        case 1:
        {
            myImage.image=mf;
            break;
        }
            
        case 2:
        {
            myImage.image=got;
            break;
        }
            
            
        default:
            break;
    }
}

@end
