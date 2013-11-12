//
//  MusiTile.m
//  SumunGrim
//
//  Created by leeje on 12/08/01.
//  Copyright (c) 2012年 kj-code. All rights reserved.
//

#import "MusiTile.h"

@interface MusiTile ()

- (void)initMusiImage;
- (void)initHaihaiimages:(CGContextRef)context;

@end

@implementation MusiTile

@synthesize haihaiImages = _haihaiImages;

#pragma mark -　Initialization
- (void)dealloc {
    
    [super dealloc];
    [_haihaiImages release];
}

- (id)init {
    
    self = [super init];
    if (self) {
        
        //Animation Key 初期化
        self.animationKey = @"defalut";
        
        //musi layerの初期化
        [self initMusiImage];
        
    }
    
    return self;
    
}

- (void)drawRect:(CGRect)rect {

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self initHaihaiimages:(CGContextRef)context];
}

- (void)initHaihaiimages:(CGContextRef)context {
    
    _haihaiImages = [[NSMutableArray alloc] initWithCapacity:5];
    
    for (int i = 1; i <= 5; i++) {
        
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"musi%d.png",i]];
        [_haihaiImages addObject:(id)image.CGImage];
        
//        CGContextDrawImage(context, self.frame, image.CGImage);
//        CGImageRef imgRef = CGBitmapContextCreateImage(context);
//        
//        [_haihaiImages addObject:(id)imgRef];
    }
    
}

- (void)initMusiImage {
    
    //Layerに挿入するイメージがあればここで処理
    musiLayer = [CALayer layer];
    UIImage *image = [UIImage imageNamed:@"musi1.png"];
    CGImageRef imgRef = [image CGImage];
    //    birdLayer.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    musiLayer.frame = CGRectMake(0, 0, 60, 40);
    musiLayer.position = CGPointMake(60, 40);
    musiLayer.contents = (id)imgRef;
    
    [self.layer addSublayer:musiLayer];
    
}


#pragma mark - Abstract Mehtods

- (void)start:(CAAnimation *)animation forKey:(NSString *)key {
    [musiLayer addAnimation:animation forKey:key];
}

- (void)stop:(NSString *)key {
    [musiLayer removeAnimationForKey:key];
}

#pragma mark - Animation delegate Methods
- (void)animationDidStart:(CAAnimation *)animation {
    NSLog(@"%@",[animation description]);
    
    if ([self.animationKey isEqualToString:@"moveAnimation"]) {
        //
    }
    //  ...else if {
    //        
    //    }
    
}

- (void)animationDidStop:(CAAnimation *)animation finished:(BOOL)flag {
    NSLog(@"%@",[animation description]);
    
    if ([self.animationKey isEqualToString:@"moveAnimation"]) {
        //
    }
    //  ...else if {
    //        
    //    }    
}

#pragma mark - defaultAnimation Methods
- (CAAnimation *)defaultAnimation {
    //
    return nil;
}

#pragma mark - image Animation Methods.
- (CAKeyframeAnimation *)imageAnimationValue:(NSArray *)images withDuration:(float)duration {
    
    CAKeyframeAnimation *imageMusi = [CAKeyframeAnimation animationWithKeyPath: @"contents"];
    imageMusi.calculationMode = kCAAnimationDiscrete;
    imageMusi.duration = duration;
    imageMusi.values = images; // NSArray of CGImageRefs
    imageMusi.repeatCount = HUGE_VAL;
    imageMusi.delegate = self;
    
    return imageMusi;
    
    
}

- (void)haihaiImageAnimation {
    
    CAKeyframeAnimation *anim = [self imageAnimationValue:_haihaiImages withDuration:1.0f];
    [musiLayer addAnimation:anim forKey:nil];

}

@end
