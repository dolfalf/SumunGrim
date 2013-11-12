//
//  VoicePlayer.h
//  SumunGrim
//
//  Created by 成洙 高 on 12/06/26.
//  Copyright (c) 2012年 Yongdeji Corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@protocol VoicePlayerDelegate <NSObject>

@required
- (void)voiceDidplayFinish;

@end

@interface VoicePlayer : NSObject <AVAudioPlayerDelegate>

@property (nonatomic, retain) AVAudioPlayer *player;
@property (nonatomic, assign) id<VoicePlayerDelegate> delegate;

- (id)init:(NSURL *)voiceFileUrl;
- (void)play;
- (void)stop;

@end
