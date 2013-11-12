//
//  PlayViewController.h
//  SumunGrim
//
//  Created by 金 容碩 on 12/06/23.
//  Copyright (c) 2012年 Yongdeji Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UISumunGurimView.h"

@interface PlayViewController : KJUIViewController <UISumunGurimViewDelegate> {
    
    IBOutlet UISumunGurimView *sgView;
}

- (IBAction)clickedButtonBack:(id)sender;

@end
