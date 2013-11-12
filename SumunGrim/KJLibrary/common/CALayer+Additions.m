//
//  CALayer+Additions.m
//  Tiles
//
//  Created by leeje on 12/07/12.
//  Copyright (c) 2012年 kj-code. All rights reserved.
//

#import "CALayer+Additions.h"


@implementation CALayer (Additions)


- (void)moveToFront {
    CALayer *superlayer = self.superlayer;
    [self retain];
    [self removeFromSuperlayer];
    [superlayer addSublayer:self];
    [self release];
}


@end
