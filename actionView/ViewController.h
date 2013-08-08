//
//  ViewController.h
//  actionView
//
//  Created by SUBRAHMANYAM NUKALA on 01/04/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIActionSheetDelegate>
@property (strong, nonatomic) IBOutlet UITextField *tf1;
@property (strong, nonatomic) IBOutlet UITextField *tf2;
@property (strong, nonatomic) IBOutlet UIButton *btn;
@property (strong, nonatomic) IBOutlet UILabel *res;

@end
