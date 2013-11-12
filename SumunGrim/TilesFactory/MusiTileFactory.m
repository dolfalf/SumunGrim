//
//  MusiTileFactory.m
//  SumunGrim
//
//  Created by leeje on 12/08/01.
//  Copyright (c) 2012年 kj-code. All rights reserved.
//

#import "MusiTileFactory.h"
#import "MusiTile.h"

@implementation MusiTileFactory

- (MusiTile* )createTile {
    return [[[MusiTile alloc] init] autorelease];
}

@end
