//
//  UISumunGurimVIew.m
//  SumunGrim
//
//  Created by jaeeun Lee on 12/06/15.
//  Copyright (c) 2012年 kj-code. All rights reserved.
//

#import "UISumunGurimView.h"

#define SUMUN_SELECTED_IMAGENAME    @"selected.png"

@implementation SumunItem

@synthesize tag;
@synthesize rect;
@synthesize imageName;
@synthesize title;
@synthesize tensu;

- (void)dealloc {

    [super dealloc];
    
    self.title = nil;
    self.imageName = nil;
}

- (id)initWithData:(NSDictionary *)data {
    
    self.title = [data objectForKey:@"title"];
    self.tensu = [[data objectForKey:@"tensu"] intValue];
    
    self.rect = CGRectMake([[data objectForKey:@"pos_x"] intValue]
                           , [[data objectForKey:@"pos_y"] intValue]
                           , [[data objectForKey:@"width"] intValue]
                           , [[data objectForKey:@"height"] intValue]);
    
    self.imageName = [data objectForKey:@"imageName"];
    self.tag = [[data objectForKey:@"tag"] intValue];
    
    return self;
}

@end


@implementation UISumunGurimView

@synthesize delegate;

#pragma mark - Life Cycle
- (void)dealloc {
    
    [sumunItems release];
    [super dealloc];
}

#pragma mark - Initialization

-(id)initWithCoder:(NSCoder *)aDecoder{
    
	self = [super initWithCoder:aDecoder];
	if (self) {
        //[self performSelectorOnMainThread:@selector(setup) withObject:nil waitUntilDone:NO];
        
	}
	return self;
    
}

- (id)initWithFrame:(CGRect)frame contentSize:(CGSize)contentSize bgImageNamed:(NSString *)bgImageNamed {
    
    self = [super initWithFrame:frame];
    
    if (self) {

        sumunItems = [[NSMutableArray alloc] initWithCapacity:10];
        
        UIScrollView *scView = [[[UIScrollView alloc] init] autorelease];
        scView.bounds = CGRectMake(0, 0, frame.size.width, frame.size.height);
        scView.contentSize = CGSizeMake(contentSize.width, contentSize.height);
        scView.contentOffset = CGPointMake(self.center.x, self.center.y);
        
        contentsView = [[[UIView alloc] initWithFrame:CGRectMake(0,0,contentSize.width, contentSize.height)] autorelease];
        
        UIImage *image = [UIImage imageNamed:bgImageNamed];
        UIImageView *imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
        [contentsView addSubview:imageView];
        [scView addSubview:contentsView];
        
        [self addSubview:scView];

    }
    
    return self;
}

- (void)setup {
    
//    sumunItems = [[NSMutableArray alloc] initWithCapacity:10];
    
    UIScrollView *scView = [[[UIScrollView alloc] init] autorelease];
    scView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    //コンテンツサイズデリゲート発行
    CGSize contentSize = [delegate willSizeForContentView];
    
    scView.contentSize = CGSizeMake(contentSize.width,contentSize.height);

    float offset_x = (contentSize.width - self.frame.size.width)/2;
    float offset_y = (contentSize.height - self.frame.size.height)/2;
    scView.contentOffset = CGPointMake(offset_x, offset_y);
    
    contentsView = [[[UIView alloc] initWithFrame:CGRectMake(0,0,contentSize.width, contentSize.height)] autorelease];
    contentsView.backgroundColor = [UIColor yellowColor];
    
    DLog(@"%@",NSStringFromCGSize(contentSize));
    
    //Backgroundイメージデリゲート発行
    UIImage *image = [delegate willBackgroundImageView];
    UIImageView *imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
    [contentsView addSubview:imageView];
    
//    [self addSumunItem:item];
    
    // Test
//    UILabel *lb_Test = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//    lb_Test.backgroundColor = [UIColor redColor];
//    lb_Test.center = contentsView.center;
//    [contentsView addSubview:lb_Test];
//    [lb_Test release];
    
    
    [scView addSubview:contentsView];
    
    [self addSubview:scView];
    
   
}

#pragma mark - touch event
- (void)buttonTouched:(id)sender {
    
    UIButton *btn = (UIButton *)sender;
//    DLog(@"button tag --> %d",btn.tag);
    SumunItem *touchedItem = nil;
    
    for (SumunItem *item in sumunItems) {
        if (item.tag == btn.tag) {
            touchedItem = item;
            break;
        }
    }
    
    //위임자에게 통지
    [delegate sumunGrimView:self didTouchedSumunItem:touchedItem];
    
    //버튼 상태변화 처리
    [btn setImage:[UIImage imageNamed:SUMUN_SELECTED_IMAGENAME] forState:UIControlStateNormal];
    
    //애니메이션 처리
    btn.alpha = 0.0f;
    btn.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    [UIView animateWithDuration:0.3f
                     animations:^{
                         btn.alpha = 1.0f;
                         btn.transform = CGAffineTransformMakeScale(1.2f, 1.2f);
                     }
                     completion:^(BOOL finished){
                         btn.transform = CGAffineTransformIdentity;
                     }];
}

#pragma mark - 숨은그림 추가,제거관련 메소드
- (void)addSumunItem:(SumunItem *)item {
    
    //画面処理
    UIButton *btn = [[UIButton alloc] initWithFrame:item.rect];
    btn.tag = item.tag;
    [btn setImage:[UIImage imageNamed:item.imageName] forState:UIControlStateNormal];

    [btn addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [contentsView addSubview:btn];
    [btn release];
    //配列に追加
//    [sumunItems addObject:item];
}

- (void)removeSumunItem:(SumunItem *)item {
    
    //画面処理
    UIButton *itemButton = (UIButton *)[contentsView viewWithTag:item.tag];
    [itemButton removeFromSuperview];
    
    //配列から削除
    [sumunItems removeObject:item];

}

- (NSArray *)SumunItemAll {
    return sumunItems;
}

- (void)updateBackgroundWithBackgroundFileName:(NSString *)fileName {
    
    //기존 배경화면 제거
    for (UIView *view in [contentsView subviews]) {
        if ([view isKindOfClass:[UIImageView class]]) {
            [view removeFromSuperview];
        }
    }
    
    //새 배경화면 셋팅
    UIImageView *imv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:fileName]];
    [contentsView addSubview:imv];
    [imv release];
}
@end
