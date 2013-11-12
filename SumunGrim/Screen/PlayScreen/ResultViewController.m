//
//  ResultViewController.m
//  SumunGrim
//
//  Created by 金 容碩 on 12/06/23.
//  Copyright (c) 2012年 Yongdeji Corp. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController

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
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:PopViewControllerToHiddenPictureGuideScreen] animated:YES];
}

- (IBAction)clickedButtonBackToMain:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
