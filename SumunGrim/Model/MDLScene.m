//
//  MDLScene.m
//  SumunGrim
//
//  Created by 金 容碩 on 12. 7. 19..
//  Copyright (c) 2012년 kj-code. All rights reserved.
//

#import "MDLScene.h"

@implementation MDLScene
@synthesize strSceneID = _strSceneID;
@synthesize strHiddenItemTitle = _strHiddenItemTitle;
@synthesize strBackgroundImageName = _strBackgroundImageName;
@synthesize strHiddenItemImageName = _strHiddenItemImageName;
@synthesize hiddenItemPointX, hiddenItemPointY, hiddenItemWidth, hiddenItemHeight, hiddenItemTag;

- (id)init {
    
    self = [super init];
    if (self != nil) {
        
        _strSceneID = [[NSString alloc] init];
        _strHiddenItemTitle = [[NSString alloc] init];
        _strBackgroundImageName = [[NSString alloc] init];
        _strHiddenItemImageName = [[NSString alloc] init];
        
        hiddenItemPointX = 0;
        hiddenItemPointY = 0;
        hiddenItemWidth = 0;
        hiddenItemHeight = 0;
        hiddenItemTag = 0;
    }
    
    return self;
}

- (void)dealloc {
    
    self.strSceneID = nil;
    self.strHiddenItemTitle = nil;
    self.strBackgroundImageName = nil;
    self.strHiddenItemImageName = nil;
    
    [super dealloc];
}


@end

