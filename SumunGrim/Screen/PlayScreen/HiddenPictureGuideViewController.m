//
//  HiddenPictureGuideViewController.m
//  SumunGrim
//
//  Created by 金 容碩 on 12. 6. 27..
//  Copyright (c) 2012년 Yongdeji Corp. All rights reserved.
//

#import "HiddenPictureGuideViewController.h"

@interface HiddenPictureGuideViewController ()

@end

@implementation HiddenPictureGuideViewController

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

- (IBAction)clickedButtonBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
