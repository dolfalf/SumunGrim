//
//  MusiTile.h
//  SumunGrim
//
//  Created by leeje on 12/08/01.
//  Copyright (c) 2012年 kj-code. All rights reserved.
//

#import "AbstractTile.h"

@interface MusiTile : AbstractTile {
    
    CALayer *musiLayer;
}

@property (nonatomic, retain, readonly) NSMutableArray *haihaiImages;

//basic Animation methods.

//image Animation Methods.
- (CAKeyframeAnimation *)imageAnimationValue:(NSArray *)images withDuration:(float)duration;
- (void)haihaiImageAnimation;

@end
