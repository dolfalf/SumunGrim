//
//  SampleTile.h
//  Tiles
//
//  Created by leeje on 12/07/12.
//  Copyright (c) 2012年 kj-code. All rights reserved.
//

#import "AbstractTile.h"
#import "CALayer+Additions.h"

@interface SampleTile : AbstractTile {
    
    CALayer *birdLayer;
}

@property (nonatomic, retain, readonly) NSMutableArray *flyImages;
@property (nonatomic, assign) BOOL shadowEffect;

//basic Animation methods.
- (CAAnimation *)moveAnimationValue:(CGPoint)destination withDuration:(float)duration;
- (CAAnimation *)scaleAnimationValue:(float)scale withDuration:(float)duration;
- (CAAnimation *)opacityAnimationValue:(float)opacity withDuration:(float)duration;
- (CAAnimation *)groupAnimationValue:(NSArray *)animations withDuration:(float)duration;

//image Animation Methods.
- (CAAnimation *)imageAnimationValue:(NSArray *)images withDuration:(float)duration;
- (CAAnimation *)flyImageAnimation;

//wiggle Methods.
- (CAAnimation *)wiggleRotationAnimationValue:(int)term;
- (CAAnimation *)wiggleSlowAnimationValue:(int)term wingleRange:(int)range;
- (CAAnimation *)wiggleTranslationYAnimationValue:(int)term;

//rotate Mehtods
- (CAAnimation*)animationForSpinning;
- (CABasicAnimation *)rotationzAnimation:(float)start:(float)end:(float)duration:(int)count;
- (CABasicAnimation *)rotationxAnimation:(float)start:(float)end:(float)duration:(int)count;
- (CABasicAnimation *)rotationyAnimation:(float)start:(float)end:(float)duration:(int)count;

@end
