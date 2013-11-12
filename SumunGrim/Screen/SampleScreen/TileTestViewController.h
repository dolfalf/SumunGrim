//
//  TileTestViewController.h
//  SumunGrim
//
//  Created by jaeeun Lee on 12/07/21.
//  Copyright (c) 2012年 kj-code. All rights reserved.
//

#import "KJUIViewController.h"

@class SampleTile;
@class MusiTile;

@interface TileTestViewController : KJUIViewController <UIGestureRecognizerDelegate> {
    
    SampleTile *sample;
    MusiTile *musi;

    //gestureのため
    float firstX;
    float firstY;
    
}

@property (nonatomic, retain) NSString *animationKey;

-(IBAction)goBack:(id)sender;

-(IBAction)defaultAnimation:(id)sender;
-(IBAction)moveAnimation:(id)sender;
-(IBAction)scaleAnimation:(id)sender;
-(IBAction)opacityAnimation:(id)sender;
-(IBAction)groupAnimation:(id)sender;
-(IBAction)wiggleRAnimation:(id)sender;
-(IBAction)wiggleTAnimation:(id)sender;
-(IBAction)flyingAnimation:(id)sender;
-(IBAction)spinningAnimation:(id)sender;
-(IBAction)rotationzAnimation:(id)sender;
-(IBAction)rotationxAnimation:(id)sender;
-(IBAction)rotationyAnimation:(id)sender;
-(IBAction)shadowEffect:(id)sender;
-(IBAction)stopAnimation:(id)sender;

//
-(IBAction)musiAnimation:(id)sender;

@end
