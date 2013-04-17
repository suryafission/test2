//
//  ViewController.m
//  Switchy
//
//  Created by Emir Fithri Samsuddin on 4/6/13.
//  Copyright (c) 2013 Emir Fithri Samsuddin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)turnOn:(id)sender {
    
    [sw1 setState:YES];
    [sw2 setState:YES];
    [sw3 setState:YES];
    [sw4 setState:YES];
    [sw5 setState:YES];
}

-(IBAction)turnOff:(id)sender {
    
    [sw1 setState:NO];
    [sw2 setState:NO];
    [sw3 setState:NO];
    [sw4 setState:NO];
    [sw5 setState:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // for demo purpose, i create 5 switches with different appearances.
    
    sw1 = [[Switchy alloc] initWithFrame:CGRectMake(0, 0, 79, 27) withOnLabel:@"ON" andOfflabel:@"OFF"
                     withContainerColor1:[UIColor colorWithRed:0.1 green:0.7 blue:1.0 alpha:1.0]
                      andContainerColor2:[UIColor colorWithRed:0.1 green:0.7 blue:0.9 alpha:1.0]
                          withKnobColor1:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]
                           andKnobColor2:[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0] withShine:YES];
    [self.view addSubview:sw1];
    sw1.center = CGPointMake(160, 50);
    
    sw2 = [[Switchy alloc] initWithFrame:CGRectMake(0, 0, 115, 60) withOnLabel:@"I" andOfflabel:@"O"
                     withContainerColor1:[UIColor colorWithRed:1.0 green:0.1 blue:0.1 alpha:1.0]
                      andContainerColor2:[UIColor colorWithRed:0.4 green:0.1 blue:0.1 alpha:1.0]
                          withKnobColor1:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]
                           andKnobColor2:[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0] withShine:YES];
    [self.view addSubview:sw2];
    sw2.center = CGPointMake(160, 130);
    
    sw3 = [[Switchy alloc] initWithFrame:CGRectMake(0, 0, 310, 20) withOnLabel:@"A Long Switch" andOfflabel:@"Is Pretty Outrages"
                     withContainerColor1:[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0]
                      andContainerColor2:[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0]
                          withKnobColor1:[UIColor colorWithRed:0.3 green:0.9 blue:1.0 alpha:1.0]
                           andKnobColor2:[UIColor colorWithRed:0.3 green:0.6 blue:0.8 alpha:1.0] withShine:NO];
    [self.view addSubview:sw3];
    sw3.center = CGPointMake(160, 210);
    
    sw4 = [[Switchy alloc] initWithFrame:CGRectMake(0, 0, 200, 100) withOnLabel:@"Y" andOfflabel:@"N"
                     withContainerColor1:[UIColor colorWithRed:0.1 green:0.9 blue:0.1 alpha:1.0]
                      andContainerColor2:[UIColor colorWithRed:0.3 green:0.9 blue:0.3 alpha:1.0]
                          withKnobColor1:[UIColor colorWithRed:1.0 green:0 blue:0 alpha:1.0]
                           andKnobColor2:[UIColor colorWithRed:0.8 green:0 blue:0 alpha:1.0] withShine:YES];
    [self.view addSubview:sw4];
    sw4.center = CGPointMake(160, 290);
    
    sw5 = [[Switchy alloc] initWithFrame:CGRectMake(0, 0, 40, 20) withOnLabel:@"+" andOfflabel:@"-"
                     withContainerColor1:[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1.0]
                      andContainerColor2:[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1.0]
                          withKnobColor1:[UIColor colorWithRed:0.3 green:0.9 blue:1.0 alpha:1.0]
                           andKnobColor2:[UIColor colorWithRed:0.3 green:0.6 blue:0.7 alpha:1.0] withShine:YES];
    [self.view addSubview:sw5];
    sw5.center = CGPointMake(160, 370);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
