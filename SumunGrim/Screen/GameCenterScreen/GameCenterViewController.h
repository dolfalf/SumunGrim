//
//  GameCenterViewController.h
//  SumunGrim
//
//  Created by 金 容碩 on 12/06/23.
//  Copyright (c) 2012年 kj-code. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KJUtil.h"

@interface GameCenterViewController : KJUIViewController<GKLeaderboardViewControllerDelegate, GKAchievementViewControllerDelegate> { 
    
        //점수판,목표달성판을 띄우는 뷰컨트롤러 딜리게이트 구현
}
    

//test
-(IBAction)test1:(id)sender;
-(IBAction)test2:(id)sender;
-(IBAction)test3:(id)sender;
-(IBAction)testpoint:(id)sender;


/////////////////Geunwon,Mo : GameCenter 추가 start 

- (IBAction)openLeaderBD:(id)sender; //점수판을 띄운다
- (IBAction)openArchivementBD:(id)sender; //목표달성판을 띄운다

- (void) showLeaderboard; //실제로 점수판을 띄우는 부분 구현 메소드
- (void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController;//점수판이 닫힐때 호출되는 메소드
- (void) showArchboard; //목표달성판을 띄우는 부분 구현 메소드
- (void)achievementViewControllerDidFinish:(GKAchievementViewController *)viewController;//목표달성판이 닫힐때 호출되는 메소드

/////////////////Geunwon,Mo : GameCenter 추가 end 

@end
