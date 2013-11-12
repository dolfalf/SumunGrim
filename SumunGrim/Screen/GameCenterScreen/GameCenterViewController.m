//
//  GameCenterViewController.m
//  SumunGrim
//
//  Created by 金 容碩 on 12/06/23.
//  Copyright (c) 2012年 kj-code. All rights reserved.
//
//GameCenter設定にかんしてはhttp://lomohome.com/357を参考
//

#import "GameCenterViewController.h"

@interface GameCenterViewController ()

@end

@implementation GameCenterViewController

#pragma mark - Life Cycle
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
    
    /////////////////Geunwon,Mo : GameCenter 추가 start /////////////
    
    //KJUtil 가 인스턴스 메소드이기 때문에 걍 쓴다
    if ([KJUtil isGameCenterAvailable]) { //게임센터가 가능한 단말이면...
        [KJUtil connectGameCenter];       //게임센터 접속~
    }
    /////////////////Geunwon,Mo : GameCenter 추가 end   /////////////
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}



#pragma mark - 테스트 메소드들
-(IBAction)test1:(id)sender {
    //이렇게 보내면 er10 이라는 ID를 가지는 목표 달성도가 25%가 찍히게 된다.
    [KJUtil sendAchievementWithIdentifier:@"er10" percentComplete:25.0f];
}

-(IBAction)test2:(id)sender {
    //이렇게 보내면 er10 이라는 ID를 가지는 목표 달성도가 완료되게 된다.
    [KJUtil sendAchievementWithIdentifier:@"er10" percentComplete:100.0f];
}

-(IBAction)test3:(id)sender {
    //이렇게 보내면 sit 이라는 ID를 가지는 목표 달성도가 완료되게 된다.
    [KJUtil sendAchievementWithIdentifier:@"sit" percentComplete:100.0f];
}

- (IBAction)testpoint:(id)sender {
    int r = rand() % 1000;
    //이렇게 보내면 점수판에 1000사이의 정수가 랜덤으로 기록되게 된다.
    [KJUtil sendScoreToGameCenter:r];
    
    //이렇게 보내면 목표달성도가 리셋되게 된다.
    [KJUtil resetAchievements];
}


#pragma mark - GameCenter Methods
/////////////////Geunwon,Mo : GameCenter 추가 start /////////////

///////////////// 점수판
// 점수판 버튼이 눌리면 호출된다.
- (IBAction)openLeaderBD:(id)sender{ 
    NSLog(@"open leader board");
    [self showLeaderboard]; // 실행~
}

- (void) showLeaderboard {
    GKLeaderboardViewController *leaderboardController = [[[GKLeaderboardViewController alloc] init]autorelease];
    if (leaderboardController != nil) {
        // 레더보드 델리게이트는 나임
        leaderboardController.leaderboardDelegate = self;
        
        // 레더보드를 현재 뷰에 모달로 띄운다.
        [self presentModalViewController:leaderboardController animated: YES];
    }
}

// 레더보드 델리게이트를 구현한 부분. 닫힐때 호출된다.
- (void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController {
    [self dismissModalViewControllerAnimated:YES]; //점수판 모달뷰를 내림
    // 추가적으로 자신의 어플에 맞게 구현해야할것이 있으면 한다.
}

///////////////// 목표달성. (점수판 구현과 방법은 똑같음)
// 목표달성판 버튼이 눌리면 호출된다.
- (IBAction)openArchivementBD:(id)sender {
    NSLog(@"open archivement board");
    [self showArchboard];
}

- (void) showArchboard {
    GKAchievementViewController *archiveController = [[[GKAchievementViewController alloc]init] autorelease];
    
    if (archiveController != nil) {
        
        archiveController.achievementDelegate = self;
        
        [self presentModalViewController:archiveController animated: YES];
        
    }
}

- (void)achievementViewControllerDidFinish:(GKAchievementViewController *)viewController{
    [self dismissModalViewControllerAnimated:YES];
}

////////////////////Geunwon,Mo : GameCenter 추가 끝 //////////////


@end
