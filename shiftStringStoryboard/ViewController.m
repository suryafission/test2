//
//  ViewController.m
//  shiftStringStoryboard
//
//  Created by SUBRAHMANYAM NUKALA on 25/03/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import "ViewController.h"
#import "mycellCell.h"
#import "detailViewController.h"
@interface ViewController ()

@end
static NSMutableArray *numbers1 ;
NSInteger count;
@implementation ViewController
@synthesize myTableView,p,numbers,str,path;
- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
    if(count == 0)
    {
        numbers= [[NSMutableArray alloc]initWithObjects:@"one",@"two",@"three", nil];
        numbers1 = numbers;
    }

    else
    {
        numbers = numbers1;
        [numbers insertObject:str atIndex:numbers.count];
        NSLog(@"%i",p);
        path = [NSIndexPath indexPathForRow:numbers.count -1 inSection:0];
        
        
        [myTableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationAutomatic];
        NSLog(@"%@",numbers);

        
    }
}
//-(void)viewDidAppear:(BOOL)animated
//{
//    [self.myTableView reloadData];
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return numbers.count;
    NSLog(@"%i",numbers.count);
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"Cell";
    path = indexPath;
    mycellCell *cell ;
    cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if(cell == Nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.textLabel.text = [numbers objectAtIndex:indexPath.row];
    NSLog(@"entered %i",count);
  // NSLog(@"%@",[numbers objectAtIndex:numbers.count -1 ]);
    return  cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    count++;
}



@end
