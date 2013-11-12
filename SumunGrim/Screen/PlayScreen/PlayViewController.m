//
//  PlayViewController.m
//  SumunGrim
//
//  Created by 金 容碩 on 12/06/23.
//  Copyright (c) 2012年 Yongdeji Corp. All rights reserved.
//

#import "PlayViewController.h"
#import "SGDataManager.h"
#import "ResultViewController.h"

@interface PlayViewController ()
@property (nonatomic, assign) NSUInteger sumunIndex;
@property (nonatomic, retain) NSMutableArray *aryItemsList;
@property (nonatomic, retain) NSMutableArray *aryBackgroundList;
@end

@implementation PlayViewController
@synthesize aryItemsList, aryBackgroundList, sumunIndex;

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
    sgView.delegate = self;
    [sgView setup];
    
    //..
    sumunIndex = 0;
    self.aryItemsList = [NSMutableArray array];
    self.aryBackgroundList = [NSMutableArray array];

    SGDataManager *manager = [SGDataManager sharedSGDataManager];
    NSArray *sceneItemList = [manager sceneModelList];
    
    for (MDLScene *model in sceneItemList) {

        NSDictionary *dicSumunItemData = [NSDictionary dictionaryWithObjectsAndKeys:model.strHiddenItemTitle, @"title",
                                          [NSNumber numberWithInt:100], @"tensu",
                                          [NSNumber numberWithInt:model.hiddenItemPointX], @"pos_x",
                                          [NSNumber numberWithInt:model.hiddenItemPointY], @"pos_y",
                                          [NSNumber numberWithInt:model.hiddenItemWidth], @"width",
                                          [NSNumber numberWithInt:model.hiddenItemHeight], @"height",
                                          model.strHiddenItemImageName, @"imageName",
                                          [NSNumber numberWithInt:model.hiddenItemTag], @"tag", nil];
        
        [aryItemsList addObject:dicSumunItemData];
        [aryBackgroundList addObject:model.strBackgroundImageName];
    }
    
    SumunItem *item = [[SumunItem alloc] initWithData:[aryItemsList objectAtIndex:sumunIndex]];
    [sgView addSumunItem:item];
    [item release];
    sumunIndex ++;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (IBAction)clickedButtonBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - UISumunGurimViewDelegate Methods
- (CGSize)willSizeForContentView {
    DLog(@"willSizeForContentView");
    return CGSizeMake(480, 320);
}

- (UIImage *)willBackgroundImageView {
    DLog(@"willBackgroundImageView");
    return [UIImage imageNamed:@"easop1-1.png"];
}

- (void)sumunGrimView:(UISumunGurimView *)sumunGrimView didTouchedSumunItem:(SumunItem *)item {
    DLog(@"didTouchedSumunItem");
    
    //점수계산처리..
    SGDataManager *manager = [SGDataManager sharedSGDataManager];
    int score = manager.intEarnPoint;
    score = score + item.tensu;
    manager.intEarnPoint = score;
    NSLog(@"sumunIndex = %d", sumunIndex);
    NSLog(@"[aryItemsList count] = %d", [aryItemsList count]);
    
    //숨은 아이템을 다 찾으면 결과화면으로 이동
    if (sumunIndex == [aryItemsList count]) {
        //숨은 아이템 초기화, 숨은그림뷰 초기화..
        
        //화면전환
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        ResultViewController *resultViewController = [story instantiateViewControllerWithIdentifier:@"ResultViewController"];
        [self.navigationController pushViewController:resultViewController animated:YES];
        return;
    }
    
    
    //다음 씬의 배경이미지 및 숨은 아이템 셋팅
    [sgView updateBackgroundWithBackgroundFileName:[aryBackgroundList objectAtIndex:sumunIndex]];
    SumunItem *sumunItem = [[SumunItem alloc] initWithData:[aryItemsList objectAtIndex:sumunIndex]];
    [sgView addSumunItem:sumunItem];
    [sumunItem release];
    sumunIndex ++;
}

@end
