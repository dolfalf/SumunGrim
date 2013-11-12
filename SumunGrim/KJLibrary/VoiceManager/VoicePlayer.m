//
//  VoicePlayer.m
//  SumunGrim
//
//  Created by 成洙 高 on 12/06/26.
//  Copyright (c) 2012年 Yongdeji Corp. All rights reserved.
//

#import "VoicePlayer.h"

@implementation VoicePlayer

@synthesize player = _player;
@synthesize delegate;

- (id)init:(NSURL *)voiceFileUrl
{
    NSLog(@"======%@", voiceFileUrl.path);
    
    if (self == [super init])
    {
        NSError *error = nil;
        
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:voiceFileUrl error:&error];
        _player.delegate = self;
        
        if (error) {
            // エラー発生時にはどのような処理を行うべき？？？？
            // エラー用のデリゲートメソッドを作成した方がよいかも。。。
            NSLog(@"error: %@", [error localizedDescription]);
        } else {
            _player.delegate = self;
        }
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];

    [_player release];
}

- (void)play {
    NSLog(@"VoicePlayer play -START");
    [_player play];
    NSLog(@"VoicePlayer play -END");
}

- (void)stop {
    [_player stop];
}

// 再生完了時に発生するイベント
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSLog(@"VoicePlayer play -Finished");
    [delegate voiceDidplayFinish];
}

@end
