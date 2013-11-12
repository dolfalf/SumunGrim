//
//  UISumunGurimView.h
//  SumunGrim
//
//  Created by jaeeun Lee on 12/06/15.
//  Copyright (c) 2012年 kj-code. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UISumunGurimView;

@interface SumunItem : NSObject {
    
}

@property (nonatomic, assign) int tag;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, assign) CGRect rect;
@property (nonatomic, retain) NSString *imageName;
@property (nonatomic, assign) int tensu;

- (id)initWithData:(NSDictionary *)data;

@end

@protocol UISumunGurimViewDelegate <NSObject>

@required
- (CGSize)willSizeForContentView;
- (UIImage *)willBackgroundImageView;

@optional
- (void)sumunGrimView:(UISumunGurimView *)sumunGrimView didTouchedSumunItem:(SumunItem *)item;

@end

@interface UISumunGurimView : UIView {
    
    UIView *contentsView;
    NSMutableArray *sumunItems;
}

@property(nonatomic,assign) IBOutlet id <UISumunGurimViewDelegate>   delegate;

- (id)initWithFrame:(CGRect)frame contentSize:(CGSize)contentSize bgImageNamed:(NSString *)bgImageNamed;
- (void)setup;

#pragma mark - 숨은그림 추가,제거관련 메소드
- (void)addSumunItem:(SumunItem *)item;
- (void)removeSumunItem:(SumunItem *)item;
- (NSArray *)SumunItemAll;
- (void)updateBackgroundWithBackgroundFileName:(NSString *)fileName;
@end


