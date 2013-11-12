//
//  VoiceRecorder.m
//  SumunGrim
//
//  Created by 成洙 高 on 12/06/26.
//  Copyright (c) 2012年 Yongdeji Corp. All rights reserved.
//

#import "VoiceRecorder.h"

@implementation VoiceRecorder

@synthesize recorder = _recorder;

- (id)init:(NSURL*)voiceFileUrl
{
    if (self == [super init])
    {
        NSLog(@"=============%@", voiceFileUrl.path);
        
        // 録音の設定 AVNumberOfChannelsKey チャンネル数1
        NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
                                  [NSNumber numberWithFloat: 44100.0], AVSampleRateKey,
                                  [NSNumber numberWithInt: kAudioFormatLinearPCM], AVFormatIDKey,
                                  [NSNumber numberWithInt: 1], AVNumberOfChannelsKey,
                                  [NSNumber numberWithInt:16], AVLinearPCMBitDepthKey,
                                  [NSNumber numberWithBool:NO], AVLinearPCMIsBigEndianKey,
                                  [NSNumber numberWithBool:NO], AVLinearPCMIsFloatKey,
                                  nil];
        NSError *error = nil;
        
        _recorder = [[AVAudioRecorder alloc] initWithURL:voiceFileUrl settings:settings error:&error];
        
        if (error) {
            // エラー発生時にはどのような処理を行うべき？？？？
            NSLog(@"error: %@", [error localizedDescription]);
        } else {
            // 録音ファイルの準備(すでにファイルが存在していれば上書きしてくれる)
            _recorder.delegate = self;
            [_recorder prepareToRecord];            
            
            // 録音中に音量をとるかどうか
            _recorder.meteringEnabled = YES;
        }
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];

    [_recorder release];
}

- (void)recoderStart
{
    // 録音開始
    [_recorder record];
}

- (void)recoderStop
{
    // 録音終了
    [_recorder stop];
}

- (BOOL)recoderDelete
{
    // 録音ファイル削除
    return [_recorder deleteRecording];
}

@end
