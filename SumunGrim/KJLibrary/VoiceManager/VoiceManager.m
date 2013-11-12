//
//  VoiceManager.m
//  SumunGrim
//
//  Created by 成洙 高 on 12/06/26.
//  Copyright (c) 2012年 Yongdeji Corp. All rights reserved.
//

#import "VoiceManager.h"

@implementation VoiceManager

@synthesize player = _player;
@synthesize recorder = _recorder;

-(id)init
{
    // 
    _player = [[VoicePlayer alloc] init:nil];
    _recorder = [[VoiceRecorder alloc] init:nil];
    
    return self;
}

- (void)dealloc
{
    [super dealloc];

    [_player release];
    [_recorder release];
}

@end
