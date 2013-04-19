//
//  ViewController.m
//  testString
//
//  Created by SUBRAHMANYAM NUKALA on 15/03/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
NSUInteger i=0;

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self selfText];
    [self selfView];
    [self selfLbl];
    [self selfLbl1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) selfView
{
    textView=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 300, 150)];
    textView.text=@"Eye-tracking athe uses the camera to lock onto the motion of a user's peepers, following wherever they move. With it, the phone can perceive where the user is looking, and can respond to a set of behaviors, let's say a very intentional movement to scroll a Web page up and down, or a long, purposeful blink to click.If your eyes have reached the bottom of a page, eye-tracking software could automatically scroll you down the following paragraphs of text.This type of technology -- which had been researched for desktop computing long before it was conceived of for the smaller smartphone screen -- has been demoed for a variety of actions: zooming in or out, pausing a video by looking away from a screen, and playing games.";
    string=textView.text;
    [self.view addSubview:textView];
    
}
-(void) selfText
{
    textField = [[UITextField alloc] initWithFrame:CGRectMake(30, 180, 130, 50)];
    textField.backgroundColor=[UIColor whiteColor];
    textField.textColor=[UIColor blackColor];
    [textField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [textField addTarget:self action:@selector(textEntered) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.view addSubview:textField];
    
}
-(void) selfLbl
{
    label=[[UILabel alloc]initWithFrame:CGRectMake(30, 250, 250, 50)];
    label.backgroundColor=[UIColor whiteColor];
    label.textColor=[UIColor blackColor];
    [self.view addSubview:label];
}
-(void) selfLbl1
{
    lbl=[[UILabel alloc]initWithFrame:CGRectMake(30, 310, 250, 50)];
    lbl.backgroundColor=[UIColor whiteColor];
    lbl.textColor=[UIColor blackColor];
    [self.view addSubview:lbl];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void)textEntered
{
    NSMutableString *string4=textField.text;
    NSMutableString *string1=[ NSMutableString stringWithString:@" "];
    [string1 appendString:string4];
    NSMutableString *string2=string;
    NSRange match;
    match = [string2 rangeOfString:string1];
    if([string4 isEqualToString:string3])
    {
        lbl.text=@"not c";
    }
    else if(i!=0)
    {
        lbl.text=@"changed";
        i=0;
        match = [textView.text rangeOfString:string1];
        string2 = textView.text;
        
    }
    
    if (match.location == NSNotFound)
    {
        string = textView.text;
        i=0;
        label.text=[NSString stringWithFormat:@"Match not found"];
    }
    else
    {
        NSUInteger p = match.location + [textField.text length]*i + i;
        label.text=[NSString stringWithFormat:@"match found at index %lu", p];
        [string2 deleteCharactersInRange: [string2 rangeOfString: string1]];
        string=string2;
        i++;
        string3= textField.text;
    }
}


@end
