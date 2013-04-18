//
//  detailViewController.m
//  shiftStringStoryboard
//
//  Created by SUBRAHMANYAM NUKALA on 25/03/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import "detailViewController.h"
#import "ViewController.h"

@interface detailViewController ()

@end

@implementation detailViewController
@synthesize mytext,str1,btn,i;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnPressed:(id)sender
{
    ViewController *vc = [[ViewController alloc]init];
    vc.p = 2;
    vc.str = mytext.text;
    [vc viewDidLoad];
//    [vc.myTableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];

}


@end
