//
//  VoiceRecorder.h
//  SumunGrim
//
//  Created by 成洙 高 on 12/06/26.
//  Copyright (c) 2012年 Yongdeji Corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface VoiceRecorder : NSObject <AVAudioRecorderDelegate>

@property (nonatomic, retain) AVAudioRecorder *recorder;

- (id)init:(NSURL*)voiceFileUrl;

- (void)recoderStart;
- (void)recoderStop;
- (BOOL)recoderDelete;

@end
