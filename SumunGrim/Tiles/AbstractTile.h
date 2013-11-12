//
//  AbstractTile.h
//  Tiles
//
//  Created by leeje on 12/07/12.
//  Copyright (c) 2012年 kj-code. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface AbstractTile : UIView {
    
}


@property (nonatomic, retain) NSString *animationKey;

- (CAAnimation *)defaultAnimation;
- (void)start:(CAAnimation *)animation forKey:(NSString *)key;
- (void)stop:(NSString *)key;

@end
