//
//  MDLScenario.m
//  SumunGrim
//
//  Created by 金 容碩 on 12. 7. 19..
//  Copyright (c) 2012년 kj-code. All rights reserved.
//

#import "MDLScenario.h"

@implementation MDLScenario
@synthesize strScenarioID = _strScenarioID;
@synthesize strScenarioTitle = _strScenarioTitle;
@synthesize strScenarioDescription = _strScenarioDescription;
@synthesize arySceneList = _arySceneList;

- (id)init {
    
    self = [super init];
    if (self != nil) {
        
        _strScenarioID = [[NSString alloc] init];
        _strScenarioTitle = [[NSString alloc] init];
        _strScenarioDescription = [[NSString alloc] init];
        _arySceneList = [[NSMutableArray alloc] initWithCapacity:5];
    }
    
    return self;
}

- (void)dealloc {
    
    self.strScenarioID = nil;
    self.strScenarioTitle = nil;
    self.strScenarioDescription = nil;
    self.arySceneList = nil;
    
    [super dealloc];
}

@end
