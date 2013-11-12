//
//  SampleTile.m
//  Tiles
//
//  Created by leeje on 12/07/12.
//  Copyright (c) 2012年 kj-code. All rights reserved.
//

#import "SampleTile.h"

@interface SampleTile ()
- (void)initBirdImage;
- (void)initFlyimages:(CGContextRef)context;

@end

@implementation SampleTile

@synthesize flyImages = _flyImages;
@synthesize shadowEffect = _shadowEffect;

#pragma mark -　Initialization
- (void)dealloc {
    
    [super dealloc];
    [_flyImages release];
}

- (id)init {
    
    self = [super init];
    if (self) {
        
        //Animation Key 初期化
        self.animationKey = @"defalut";
        
        //bird layerの初期化
        [self initBirdImage];

        
        if (_shadowEffect == YES) {
            birdLayer.shadowRadius = 3;
            birdLayer.shadowColor = [UIColor blackColor].CGColor;
            birdLayer.shadowOpacity = 0.5;
            birdLayer.shadowOffset = CGSizeMake(1, 3); //defaultは 0, -3
        }
        
        
    }
    return self;
    
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self initFlyimages:(CGContextRef)context];
}

- (void)setShadowEffect:(BOOL)value {
    
    _shadowEffect = value;
    
    if (_shadowEffect == YES) {
        birdLayer.shadowRadius = 3;
        birdLayer.shadowColor = [UIColor blackColor].CGColor;
        birdLayer.shadowOpacity = 0.5;
        birdLayer.shadowOffset = CGSizeMake(1, 3); //defaultは 0, -3
    }
    
    
}

- (void)initFlyimages:(CGContextRef)context {
    
    _flyImages = [[NSMutableArray alloc] initWithCapacity:5];
    
    for (int i = 1; i < 5; i++) {
        
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"flybird_%d.png",i]];
        CGContextDrawImage(context, self.frame, image.CGImage);
        CGImageRef imgRef = CGBitmapContextCreateImage(context);
        
        [_flyImages addObject:(id)imgRef];
    }
}

- (void)initBirdImage {
    
    //Layerに挿入するイメージがあればここで処理

    birdLayer = [CALayer layer];
//    birdLayer.bounds = CGRectMake(0, 0, 60, 40);
//    birdLayer.position = CGPointMake(300, 100);
    birdLayer.cornerRadius = 10;
    //imageLayer.backgroundColor = [UIColor redColor].CGColor;
    UIImage *image = [UIImage imageNamed:@"bird.png"];
    CGImageRef imgRef = [image CGImage];
//    birdLayer.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    birdLayer.bounds = CGRectMake(0, 0, 60, 40);
    birdLayer.position = CGPointMake(150, 50);
    birdLayer.contents = (id)imgRef;
    
    [self.layer addSublayer:birdLayer]; // 만든 레이어를 뷰 레이어에 올립니다.
    
}

#pragma mark - Abstract Mehtods
- (void)start:(CAAnimation *)animation forKey:(NSString *)key {
    [birdLayer addAnimation:animation forKey:key];
}

- (void)stop:(NSString *)key {
    [birdLayer removeAnimationForKey:key];
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
    
    //Default Animation 処理
    return [self wiggleSlowAnimationValue:5 wingleRange:6];
     
}

#pragma mark - basic Animation Methods

- (CAAnimation *)moveAnimationValue:(CGPoint)destination withDuration:(float)duration {
    
    self.animationKey = @"moveAnimation";
    
    /* 이동할 위치 지정 */
    CGMutablePathRef path1 = CGPathCreateMutable();
    CGPathMoveToPoint(path1,NULL,birdLayer.position.x, birdLayer.position.y);
    CGPathAddLineToPoint(path1, NULL, destination.x, destination.y);
    
    /* 이동 애니메이션 작성 */
    CAKeyframeAnimation *moveBird = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveBird.path = path1;
    moveBird.rotationMode = kCAAnimationRotateAutoReverse;
    moveBird.duration = duration;
    moveBird.delegate = self;
    return moveBird;
    
}

- (CAAnimation *)scaleAnimationValue:(float)scale withDuration:(float)duration {
    
    /* 스케일 애니메이션 작성 */
    CABasicAnimation *scaleBird = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleBird.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    
//    scaleBird.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)];
    scaleBird.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(scale, scale, 1.0)];
    scaleBird.duration = duration;
    scaleBird.delegate = self;
    
    return scaleBird;
}

- (CAAnimation *)opacityAnimationValue:(float)opacity withDuration:(float)duration {
    
    /* 투명 애니메이션 작성 */
    CABasicAnimation *opacityBird = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityBird.toValue = [NSNumber numberWithFloat:opacity];
    opacityBird.duration = duration;
    opacityBird.delegate = self;
    
    return opacityBird;

}

- (CAAnimation *)groupAnimationValue:(NSArray *)animations withDuration:(float)duration {
    
    /* 애니메이션 그룹 작성 */
    CAAnimationGroup *group = [CAAnimationGroup animation];
//    group.animations = [NSArray arrayWithObjects:moveBird, scaleBird, opacityBird, nil];
    group.animations = animations;
    group.duration = duration;
    group.delegate = self;
    
    return group;

}

#pragma mark - image Animation Methods.
- (CAAnimation *)imageAnimationValue:(NSArray *)images withDuration:(float)duration {
    
    CAKeyframeAnimation *imageBird = [CAKeyframeAnimation animationWithKeyPath: @"contents"];
    imageBird.calculationMode = kCAAnimationDiscrete;
    imageBird.duration = duration;
    imageBird.values = images; // NSArray of CGImageRefs
    imageBird.delegate = self;
    
    return imageBird;
    
}

- (CAAnimation *)flyImageAnimation {
    
    return [self imageAnimationValue:_flyImages withDuration:3.0f];
}

#pragma mark - wiggle Mehtods
- (CAAnimation *)wiggleRotationAnimationValue:(int)term {
    
    CAKeyframeAnimation *wiggleBird = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    wiggleBird.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:-0.05f],[NSNumber numberWithFloat:0.05f],nil];
    wiggleBird.duration = 0.09f + ((term % 10) * 0.01f);
    wiggleBird.autoreverses = YES;
    wiggleBird.repeatCount = 5;
    wiggleBird.delegate = self;

    return wiggleBird;
}

- (CAAnimation *)wiggleSlowAnimationValue:(int)term wingleRange:(int)range {
    
    CABasicAnimation *wiggleBird = [CABasicAnimation animationWithKeyPath:@"transform"];
    wiggleBird.duration = (term % 10) * 0.1f;
    wiggleBird.repeatCount = 10;    //0.09f + ((index % 10) * 0.01f);
    wiggleBird.autoreverses = YES;
//    wiggleBird.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(birdLayer.transform,0.6, 0.0 ,0.4 ,1.0)];
    wiggleBird.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(birdLayer.transform,(range * 0.1), 0.0 ,(1.0 - (range * 0.1)) ,1.0)];
    wiggleBird.delegate = self;
    
    return wiggleBird;
    
}

- (CAAnimation *)wiggleTranslationYAnimationValue:(int)term {
    
    CAKeyframeAnimation *trnasBird = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
    trnasBird.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:-1.0f],[NSNumber numberWithFloat:1.0f],nil];
    trnasBird.duration = 0.07f + ((term % 10) * 0.01f);
    trnasBird.autoreverses = YES;
    trnasBird.repeatCount = 5;
    trnasBird.additive = YES;
    trnasBird.delegate = self;
    
    return trnasBird;
}

#pragma mark - rotate Mehtods
- (CAAnimation*)animationForSpinning {
    
    // Create a transform to rotate in the z-axis
    float radians = 360 * (M_PI / 180);
    CATransform3D transform;
    transform = CATransform3DMakeRotation(radians, 0, 0, 1.0);
    
    // Create a basic animation to animate the layer's transform
    CABasicAnimation* animation;
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    // Now assign the transform as the animation's value. While
    // animating, CABasicAnimation will vary the transform
    // attribute of its target, which for this transform will spin
    // the target like a wheel on its z-axis. 
    animation.toValue = [NSValue valueWithCATransform3D:transform];
    
    animation.duration = 2;  // two seconds
    animation.cumulative = YES;
    animation.repeatCount = 10000;  //forever
    animation.delegate = self;
    
    return animation;
}

//z축 회전
- (CABasicAnimation *)rotationzAnimation:(float)start:(float)end:(float)duration:(int)count {
    
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotation.fromValue = [NSNumber numberWithFloat:(start * M_PI / 180.0f)];
    rotation.toValue = [NSNumber numberWithFloat:(end * M_PI / 180.0f)];
    rotation.duration = duration;
    rotation.repeatCount = count;
    rotation.delegate = self;
    
    return rotation;
}

//x축 회전(가로 회전)
- (CABasicAnimation *)rotationxAnimation:(float)start:(float)end:(float)duration:(int)count {

    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotation.fromValue = [NSNumber numberWithFloat:(start * M_PI / 180.0f)];
    rotation.toValue = [NSNumber numberWithFloat:(end * M_PI / 180.0f)];
    rotation.duration = duration;
    rotation.repeatCount = count;
    rotation.delegate = self;
    
    return rotation;
}

//y축 회전(세로 회전)
- (CABasicAnimation *)rotationyAnimation:(float)start:(float)end:(float)duration:(int)count {
    
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotation.fromValue = [NSNumber numberWithFloat:(start * M_PI / 180.0f)];
    rotation.toValue = [NSNumber numberWithFloat:(end * M_PI / 180.0f)];
    rotation.duration = duration;
    rotation.repeatCount = count;
    rotation.delegate = self;
    
    return rotation;
}

@end
