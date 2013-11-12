//
//  ScenarioContentViewController.h
//  SumunGrim
//
//  Created by 成洙 高 on 12/06/30.
//  Copyright (c) 2012年 Yongdeji Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScenarioContentViewControllerDelegate <NSObject>

@required
- (void)clickedButtonPage;

@end

@interface ScenarioContentViewController : UIViewController

@property (strong, nonatomic) NSString *labelContents;
@property (strong, nonatomic) NSString *myScenarioID;
@property (strong, nonatomic) NSString *myImgName;

@property (strong, nonatomic) IBOutlet UIImageView *myImage;
@property (strong, nonatomic) IBOutlet UILabel *myTitle;
@property (strong, nonatomic) IBOutlet UILabel *myDescription;

@property (nonatomic, assign) id<ScenarioContentViewControllerDelegate> delegate;

- (IBAction)clickedButton:(id)sender;

@end
