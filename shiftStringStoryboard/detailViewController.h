//
//  detailViewController.h
//  shiftStringStoryboard
//
//  Created by SUBRAHMANYAM NUKALA on 25/03/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *mytext;
@property (weak , nonatomic) NSMutableString *str1;
- (IBAction)btnPressed:(id)sender;

- (IBAction)btnPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property NSInteger * i;
@end
