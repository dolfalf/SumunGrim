//
//  SGDataManager.h
//  SumunGrim
//
//  Created by 金 容碩 on 12. 7. 19..
//  Copyright (c) 2012년 kj-code. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDLScenario.h"
#import "MDLScene.h"

@interface SGDataManager : NSObject

@property (nonatomic, assign) int intEarnPoint;

+ (SGDataManager *)sharedSGDataManager;
- (id)init;

/* 시나리오 선택화면관련 메소드 */
- (void)selectScenarioWithScenarioID:(NSString *)scenarioID;                            //선택된 시나리오의 아이디를 입력..
- (NSUInteger)scenarioCount;                                                            //시나리오 갯수를 반환
- (NSString *)scenarioIDWithScenarioIndexNumber:(NSUInteger)indexNumber;                //시나리오 인덱스번호를 넘기면 시나리오ID를 반환
- (NSString *)scenarioTitleWithScenarioIndexNumber:(NSUInteger)indexNumber;             //시나리오 인덱스번호를 넘기면 시나리오 타이틀을 반환
- (NSString *)scenarioDescriptionWithScenarioIndexNumber:(NSUInteger)indexNumber;       //시나리오 인덱스번호를 넘기면 시나리오 설명문을 반환
- (NSString *)scenarioImageNameWithScenarioIndexNumber:(NSUInteger)indexNumber;         //시나리오 인덱스번호를 넘기면 시나리오 삽화 이미지 파일명을 반환

/* 숨은그림 안내화면관련 메소드 */
- (NSArray *)hiddenItemTitleList;                                                       //숨은그림의 타이틀 리스트를 반환
- (NSArray *)hiddenItemImageNameList;                                                   //숨은그림의 이미지 파일명 리스트를 반환

/* 게임 플레이화면관련 메소드 */
- (NSArray *)sceneModelList;

@end
