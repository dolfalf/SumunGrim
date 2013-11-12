//
//  SampleTileFactory.m
//  Tiles
//
//  Created by leeje on 12/07/12.
//  Copyright (c) 2012年 kj-code. All rights reserved.
//

#import "SampleTileFactory.h"
#import "SampleTile.h"

@implementation SampleTileFactory

- (SampleTile* )createTile {
    return [[[SampleTile alloc] init] autorelease];
}

@end
