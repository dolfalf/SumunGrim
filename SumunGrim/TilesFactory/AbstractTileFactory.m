//
//  AbstractTileFactory.m
//  Tiles
//
//  Created by leeje on 12/07/12.
//  Copyright (c) 2012年 kj-code. All rights reserved.
//

#import "AbstractTileFactory.h"

//Factory class add.
#import "SampleTileFactory.h"
#import "MusiTileFactory.h"

@implementation AbstractTileFactory

+ (AbstractTileFactory*)factoryWithTile:(NSString*)tile {
    
    if ([tile isEqualToString:@"SampleTile"]) {
        return [[[SampleTileFactory alloc] init] autorelease];
        
    }else if ([tile isEqualToString:@"MusiTile"]) {
        return [[[MusiTileFactory alloc] init] autorelease];
    }
    
    return nil;
}

- (AbstractTile* )createTile {
    return nil;
}

@end
