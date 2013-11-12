//
//  AbstractTileFactory.h
//  Tiles
//
//  Created by leeje on 12/07/12.
//  Copyright (c) 2012年 kj-code. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractTile.h"

@interface AbstractTileFactory : NSObject

+ (AbstractTileFactory*)factoryWithTile:(NSString*)tile;
- (AbstractTile* )createTile;

@end
