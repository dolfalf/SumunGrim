//
//  AbstractTile.m
//  Tiles
//
//  Created by leeje on 12/07/12.
//  Copyright (c) 2012年 kj-code. All rights reserved.
//

#import "AbstractTile.h"

@implementation AbstractTile

@synthesize animationKey = _animationKey;

- (void)dealloc {
    [super dealloc];
    [_animationKey release];
}

- (CAAnimation *)defaultAnimation {
    //サーブクラスに実装
    return nil;
}

- (void)start:(CAAnimation *)animation forKey:(NSString *)key {
    //サーブクラスに実装
}
- (void)stop:(NSString *)key {
    //サーブクラスに実装
}

@end
