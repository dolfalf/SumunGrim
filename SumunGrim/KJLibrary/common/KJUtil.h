//
//  KJUtil.h
//  SumunGrim
//
//  Created by leeje on 12/07/03.
//  Copyright (c) 2012年 kj-code. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>
#import "GKAchievementHandler.h" //이건 노티를 위해서 임포트

@interface KJUtil : NSObject{

    
}


#pragma mark - GameCenter Methods
+ (BOOL) isGameCenterAvailable ; //게임센터가 사용가능하지 알아보는 메소드
+ (void) connectGameCenter; //게임센터에 접속하는 메소드
+(void) sendScoreToGameCenter:(int)_score; //게임센터서버에 점수 보내는 메소드
+ (void) sendAchievementWithIdentifier: (NSString*) identifier percentComplete: (float) percent;//게임센터서버에 목표달성 보내는 메소드
+ (void) resetAchievements; //테스트용으로 목표달성도를 리셋하는 메소드

@end
