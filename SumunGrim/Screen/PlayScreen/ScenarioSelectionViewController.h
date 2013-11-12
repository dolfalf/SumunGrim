//
//  ScenarioSelectionViewController.h
//  SumunGrim
//
//  Created by 金 容碩 on 12. 6. 27..
//  Copyright (c) 2012년 Yongdeji Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScenarioContentViewController.h"
#import "HiddenPictureGuideViewController.h"
#import "SGDataManager.h"

@interface ScenarioSelectionViewController : KJUIViewController
<UIPageViewControllerDelegate, UIPageViewControllerDataSource, ScenarioContentViewControllerDelegate> {
    SGDataManager *manager;
}

@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) NSMutableArray *modelArray;

- (IBAction)clickedButtonBack:(id)sender;

@end
