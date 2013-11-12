//
//  KJUIViewController.m
//  SumunGrim
//
//  Created by jaeeun Lee on 12/06/23.
//  Copyright (c) 2012年 kj-code. All rights reserved.
//

#import "KJUIViewController.h"

@interface KJUIViewController ()

@end

@implementation KJUIViewController

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

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight)
    || (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
