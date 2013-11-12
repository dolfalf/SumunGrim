//
//  ScenarioSelectionViewController.m
//  SumunGrim
//
//  Created by 金 容碩 on 12. 6. 27..
//  Copyright (c) 2012년 Yongdeji Corp. All rights reserved.
//

#import "ScenarioSelectionViewController.h"

@interface ScenarioSelectionViewController ()

@end

@implementation ScenarioSelectionViewController

@synthesize pageViewController, modelArray;

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
    manager = [SGDataManager sharedSGDataManager];
    NSUInteger count = [manager scenarioCount];
    BOOL even = (count % 2 == 0 ? TRUE : FALSE);
    NSUInteger countMax = even ? count : count + 1;

    self.modelArray = [NSMutableArray array];
    
    for (int index = 0; index < countMax - 1; index++) {
        if (!(!even && index == countMax)) {
            [modelArray addObject:[manager scenarioTitleWithScenarioIndexNumber:index]];
        }
    }
    
    //옵션생성 UIPageViewControllerSpineLocationMid를 씀으로써 두 개의 페이지를 한꺼번에 표시할 수 있음.
    NSDictionary *options = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationMid] forKey:UIPageViewControllerOptionSpineLocationKey];
    
    pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
    
    pageViewController.delegate = self;
    pageViewController.dataSource = self;
    
    //왼쪽페이지 및 오른쪽 페이지를 생성
    ScenarioContentViewController *previousViewController = [[ScenarioContentViewController alloc] initWithNibName:@"ScenarioContentViewController" bundle:nil];
    ScenarioContentViewController *nextViewController = [[ScenarioContentViewController alloc] initWithNibName:@"ScenarioContentViewController" bundle:nil];
    
    previousViewController.delegate = self;
    nextViewController.delegate = self;

    // 何故かこのタイミングではないとタイトルが表示されない。
    // 左側のタイトルを設定
    previousViewController.labelContents = [modelArray objectAtIndex:0];
    previousViewController.myScenarioID =  [manager scenarioIDWithScenarioIndexNumber:0];
    previousViewController.myImgName = [manager scenarioImageNameWithScenarioIndexNumber:0];

    // 右側のタイトルを設定
    nextViewController.labelContents = [modelArray objectAtIndex:1];
    nextViewController.myScenarioID =  [manager scenarioIDWithScenarioIndexNumber:1];
    nextViewController.myImgName = [manager scenarioImageNameWithScenarioIndexNumber:1];
    
    // 何故かこのタイミングではないとイメージが表示されない。
    
    NSArray *viewControllers = [NSArray arrayWithObjects:previousViewController, nextViewController, nil];
    [pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];

    // 表示するビューのサイズを変更してみる。
    self.pageViewController.view.frame = 
    CGRectMake(20, 
               60,
               self.pageViewController.view.frame.size.width - 40, 
               self.pageViewController.view.frame.size.height - 80);
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    [manager release];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

//- (void)viewDidAppear:(BOOL)animated
//{
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
//}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger currentIndex = [self.modelArray indexOfObject:[(ScenarioContentViewController *)viewController labelContents]];
    NSString *ttt = [(ScenarioContentViewController *)viewController labelContents];
    
    NSLog(@"LEFT  index[%d]  [%@] [%@]", currentIndex, ttt, [manager scenarioImageNameWithScenarioIndexNumber:currentIndex - 1]);
    if(currentIndex == 0)
    {
        NSLog(@"LEFT  NIL");
        return nil;
    }
    ScenarioContentViewController *contentViewController = [[ScenarioContentViewController alloc] init];
    contentViewController.delegate = self;
    contentViewController.labelContents = [self.modelArray objectAtIndex:currentIndex - 1];
    contentViewController.myScenarioID =  [manager scenarioIDWithScenarioIndexNumber:currentIndex - 1];
    contentViewController.myImgName = [manager scenarioImageNameWithScenarioIndexNumber:currentIndex - 1];
    return contentViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger currentIndex = [self.modelArray indexOfObject:[(ScenarioContentViewController *)viewController labelContents]];
    NSString *ttt = [(ScenarioContentViewController *)viewController labelContents];
    NSUInteger count = [manager scenarioCount];
    BOOL even = (count % 2 == 0 ? TRUE : FALSE);
    NSUInteger countMax = even ? count : count + 1;

    NSLog(@"RIGHT index[%d]  [%@] [%@]", currentIndex, ttt, [manager scenarioImageNameWithScenarioIndexNumber:currentIndex - 1]);
    if(currentIndex == countMax - 1)
    {
        NSLog(@"RIGHT NIL");
        return nil;
    }
    ScenarioContentViewController *contentViewController = [[ScenarioContentViewController alloc] init];
    contentViewController.delegate = self;
    if (self.modelArray.count > currentIndex + 1)
    {
        contentViewController.labelContents = [self.modelArray objectAtIndex:currentIndex + 1];
        contentViewController.myScenarioID =  [manager scenarioIDWithScenarioIndexNumber:currentIndex - 1];
        contentViewController.myImgName = [manager scenarioImageNameWithScenarioIndexNumber:currentIndex + 1];
    }
    return contentViewController;
}

- (IBAction)clickedButtonBack:(id)sender 
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clickedButtonPage
{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    HiddenPictureGuideViewController *hidden = [story instantiateViewControllerWithIdentifier:
                                                @"HiddenPictureGuideViewController"];
    
    // シナリオ番号などを渡す。

    // 画面遷移
    [self.navigationController pushViewController:hidden animated:YES];
}

@end
