//
//  SGDataManager.m
//  SumunGrim
//
//  Created by 金 容碩 on 12. 7. 19..
//  Copyright (c) 2012년 kj-code. All rights reserved.
//

#import "SGDataManager.h"

@interface SGDataManager()
@property (nonatomic, retain) NSString *strSelectedScenarioID;
@property (nonatomic, retain) MDLScenario *selectedMDLScenario;
@property (nonatomic, retain) NSMutableArray *aryScenarioList;
@end


@implementation SGDataManager
@synthesize selectedMDLScenario = _selectedMDLScenario;
@synthesize strSelectedScenarioID = _strSelectedScenarioID;
@synthesize aryScenarioList = _aryScenarioList;
@synthesize intEarnPoint;

static dispatch_once_t pred;
static SGDataManager *sharedSGDataManager = nil;

+ (SGDataManager *)sharedSGDataManager {
    
    dispatch_once(&pred, ^{
        sharedSGDataManager = [[self alloc] init];
    });
    
    return sharedSGDataManager;
}

#pragma mark - init

- (id)init {
    
    self = [super init];
    if (self != nil) {
        
       // ..
        _selectedMDLScenario = [[MDLScenario alloc] init];
        _strSelectedScenarioID = [[NSString alloc] init];
        _aryScenarioList = [[NSMutableArray alloc] init];
        intEarnPoint = 0;
        
        [self performSelector:@selector(setScenarioList)];
    }
    return self;
}

- (void)setScenarioList {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ScenarioDataList" ofType:@"plist"];
    NSDictionary *pDic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    for (id key in pDic) {
        
        NSDictionary *dic = [pDic objectForKey:key];
        MDLScenario *mdlScenario = [[MDLScenario alloc] init];
        mdlScenario.strScenarioID = [dic objectForKey:@"ScenarioID"];
        mdlScenario.strScenarioTitle = [dic objectForKey:@"Title"];
        mdlScenario.strScenarioDescription = [dic objectForKey:@"Description"];
        
        NSLog(@"%@", mdlScenario.strScenarioID);
        NSLog(@"%@", mdlScenario.strScenarioTitle);
        NSLog(@"%@", mdlScenario.strScenarioDescription);
        
        NSArray *ary = [NSArray arrayWithArray:[dic objectForKey:@"Scene"]];

        for (NSDictionary *tmpDic in ary) {
            MDLScene *mdlScene = [[MDLScene alloc] init];
            mdlScene.strSceneID = [tmpDic objectForKey:@"SceneID"];
            mdlScene.strHiddenItemTitle = [tmpDic objectForKey:@"HiddenItemTitle"];
            mdlScene.strBackgroundImageName = [tmpDic objectForKey:@"BackgroundImageFileName"];
            mdlScene.strHiddenItemImageName = [tmpDic objectForKey:@"HiddenItemImageFileName"];
            mdlScene.hiddenItemPointX = [[tmpDic objectForKey:@"HiddenItemImagePointX"] intValue];
            mdlScene.hiddenItemPointY = [[tmpDic objectForKey:@"HiddenItemImagePointY"] intValue];
            mdlScene.hiddenItemWidth = [[tmpDic objectForKey:@"HiddenItemImageWidth"] intValue];
            mdlScene.hiddenItemHeight = [[tmpDic objectForKey:@"HiddenItemImageHeight"] intValue];
            mdlScene.hiddenItemTag = [[tmpDic objectForKey:@"HiddenItemTag"] intValue];
            
            NSLog(@"%@", mdlScene.strSceneID);
            NSLog(@"%@", mdlScene.strHiddenItemTitle);
            NSLog(@"%@", mdlScene.strBackgroundImageName);
            NSLog(@"%@", mdlScene.strHiddenItemImageName);
            NSLog(@"%d", mdlScene.hiddenItemPointX);
            NSLog(@"%d", mdlScene.hiddenItemPointY);
            NSLog(@"%d", mdlScene.hiddenItemWidth);
            NSLog(@"%d", mdlScene.hiddenItemHeight);
            NSLog(@"%d", mdlScene.hiddenItemTag);
            
            [mdlScenario.arySceneList addObject:mdlScene];
            [mdlScene release];
        }
        
        [_aryScenarioList addObject:mdlScenario];
        [mdlScenario release];
    }
    
    //Test 시나리오 셋팅. 나중에 빼야함.
    self.strSelectedScenarioID = @"Scenario1";
    [self selectScenarioWithScenarioID:_strSelectedScenarioID];
}

#pragma mark - 시나리오 선택화면관련 메소드
- (void)selectScenarioWithScenarioID:(NSString *)scenarioID {
    for (MDLScenario *model in _aryScenarioList) {
        if ([model.strScenarioID isEqualToString:scenarioID]) {
            self.selectedMDLScenario = model;
            break;
        }
    }
}

- (NSUInteger)scenarioCount {
    NSUInteger count = [_aryScenarioList count];
    return count;
}

- (NSString *)scenarioIDWithScenarioIndexNumber:(NSUInteger)indexNumber {
    MDLScenario *model = [_aryScenarioList objectAtIndex:indexNumber];
    NSString *string = [[NSString alloc] initWithString:model.strScenarioID];
    return [string autorelease];
}

- (NSString *)scenarioTitleWithScenarioIndexNumber:(NSUInteger)indexNumber {
    MDLScenario *model = [_aryScenarioList objectAtIndex:indexNumber];
    NSString *string = [[NSString alloc] initWithString:model.strScenarioTitle];
    return [string autorelease];
}

- (NSString *)scenarioDescriptionWithScenarioIndexNumber:(NSUInteger)indexNumber {
    MDLScenario *model = [_aryScenarioList objectAtIndex:indexNumber];
    NSString *string = [[NSString alloc] initWithString:model.strScenarioDescription];
    return [string autorelease];
}

- (NSString *)scenarioImageNameWithScenarioIndexNumber:(NSUInteger)indexNumber {
    MDLScenario *scenarioModel = [_aryScenarioList objectAtIndex:indexNumber];
    MDLScene *sceneModel = [scenarioModel.arySceneList objectAtIndex:0];
    NSString *string = [[NSString alloc] initWithString:sceneModel.strBackgroundImageName];
    return [string autorelease];
}

#pragma mark - 숨은그림 안내화면관련 메소드
- (NSArray *)hiddenItemTitleList {
    NSArray *array = [NSArray arrayWithArray:_selectedMDLScenario.arySceneList];
    NSMutableArray *titleList = [[NSMutableArray alloc] initWithCapacity:10];
    
    for (MDLScene *model in array) {
        [titleList addObject:model.strHiddenItemTitle];
    }
    
    return [titleList autorelease];
}

- (NSArray *)hiddenItemImageNameList {
    NSArray *array = [NSArray arrayWithArray:_selectedMDLScenario.arySceneList];
    NSMutableArray *imageNameList = [[NSMutableArray alloc] initWithCapacity:10];
    
    for (MDLScene *model in array) {
        [imageNameList addObject:model.strHiddenItemImageName];
    }
    
    return [imageNameList autorelease];
}

#pragma mark - 게임 플레이화면관련 메소드
- (NSArray *)sceneModelList {
    NSArray *list = [[NSArray alloc]initWithArray:_selectedMDLScenario.arySceneList];
    return [list autorelease];
}
@end
