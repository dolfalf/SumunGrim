//
//  VoiceManager.h
//  SumunGrim
//
//  Created by 成洙 高 on 12/06/26.
//  Copyright (c) 2012年 Yongdeji Corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VoicePlayer.h"
#import "VoiceRecorder.h"

@interface VoiceManager : NSObject

@property (nonatomic, retain) VoicePlayer *player;
@property (nonatomic, retain) VoiceRecorder *recorder;

@end
