//
//  ViewController.h
//  shiftStringStoryboard
//
//  Created by SUBRAHMANYAM NUKALA on 25/03/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property NSInteger * p;
@property (strong ,nonatomic)NSString *str;
@property (strong , nonatomic) NSMutableArray * numbers;
@property (strong, nonatomic) NSIndexPath *path;

@end
