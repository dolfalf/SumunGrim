//
//  MDLScene.h
//  SumunGrim
//
//  Created by 金 容碩 on 12. 7. 19..
//  Copyright (c) 2012년 kj-code. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDLScene : NSObject

@property (nonatomic, retain) NSString *strSceneID;
@property (nonatomic, retain) NSString *strHiddenItemTitle;
@property (nonatomic, retain) NSString *strBackgroundImageName;
@property (nonatomic, retain) NSString *strHiddenItemImageName;
@property (nonatomic, assign) int hiddenItemPointX;
@property (nonatomic, assign) int hiddenItemPointY;
@property (nonatomic, assign) int hiddenItemWidth;
@property (nonatomic, assign) int hiddenItemHeight;
@property (nonatomic, assign) int hiddenItemTag;

@end
