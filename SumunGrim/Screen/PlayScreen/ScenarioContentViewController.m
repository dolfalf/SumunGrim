//
//  ScenarioContentViewController.m
//  SumunGrim
//
//  Created by 成洙 高 on 12/06/30.
//  Copyright (c) 2012年 Yongdeji Corp. All rights reserved.
//

#import "ScenarioContentViewController.h"

@interface ScenarioContentViewController ()

@end

@implementation ScenarioContentViewController

@synthesize labelContents;
@synthesize myScenarioID;
@synthesize myImgName;
@synthesize myTitle, myDescription;
@synthesize myImage;
@synthesize delegate;

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
    // Do any additional setup after loading the view from its nib.
    self.myTitle.text = labelContents;
    [myImage setImage:[UIImage imageNamed:myImgName]];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)clickedButton:(id)sender
{
    if ([delegate respondsToSelector:@selector(clickedButtonPage)]) {
//        testLabel.text = @"CLOCKED";
		[delegate clickedButtonPage];
	} else {
//        testLabel.text = @"NONE";
    }
}

@end
