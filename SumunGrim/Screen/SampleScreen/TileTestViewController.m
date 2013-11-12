//
//  TileTestViewController.m
//  SumunGrim
//
//  Created by jaeeun Lee on 12/07/21.
//  Copyright (c) 2012年 kj-code. All rights reserved.
//

#import "TileTestViewController.h"
#import "SampleTile.h"
#import "MusiTile.h"

@interface TileTestViewController ()

@end

@implementation TileTestViewController

@synthesize animationKey;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //factory呼び出し
    AbstractTileFactory* birdFactory = [AbstractTileFactory factoryWithTile:@"SampleTile"];
    //インスタンス取得
    sample = (SampleTile *)[birdFactory createTile];
    sample.frame = CGRectMake(480-200, 0, 200, 150);
    sample.backgroundColor = [UIColor clearColor]; //test
    
    //画面へ貼付ける
    [self.view addSubview:sample];
    
    
    AbstractTileFactory* musiFactory = [AbstractTileFactory factoryWithTile:@"MusiTile"];
    //インスタンス取得
    musi = (MusiTile *)[musiFactory createTile];
    musi.frame = CGRectMake(50, 50, 100, 100);
    musi.backgroundColor = [UIColor clearColor]; //test
    
    //画面へ貼付ける
    [self.view addSubview:musi];
    
    //Gesture登録
    UIPanGestureRecognizer *dragRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(musidragGesture:)];
    [dragRecognizer setDelegate:self];
    [musi addGestureRecognizer:dragRecognizer];    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma Gesture Mehtods
- (void)musidragGesture:(UIPanGestureRecognizer *)gesture {
    
    CGPoint translatedPoint = [(UIPanGestureRecognizer*)gesture translationInView:self.view];
    
    if([(UIPanGestureRecognizer*)gesture state] == UIGestureRecognizerStateBegan) {
        
        firstX = [[gesture view] center].x;
        firstY = [[gesture view] center].y;
    }
    
    translatedPoint = CGPointMake(firstX+translatedPoint.x, firstY+translatedPoint.y);
    [[gesture view] setCenter:translatedPoint];
}

#pragma IBAction Mehtods
-(IBAction)goBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)defaultAnimation:(id)sender {
    
    self.animationKey = @"default";
    [sample start:[sample defaultAnimation] forKey:self.animationKey];
}

-(IBAction)moveAnimation:(id)sender {
    
    self.animationKey = @"moveA";
    
    CAAnimation *moveA = [sample moveAnimationValue:CGPointMake(100,100) withDuration:3.0f];
    [sample start:moveA forKey:self.animationKey];
}

-(IBAction)scaleAnimation:(id)sender {
    
    self.animationKey = @"scaleA";
    
    CAAnimation *scaleA = [sample scaleAnimationValue:1.3f withDuration:3.0f];
    [sample start:scaleA forKey:self.animationKey];
}

-(IBAction)opacityAnimation:(id)sender {
    
    self.animationKey = @"opacityA";
    
    CAAnimation *opacityA = [sample opacityAnimationValue:0.2f withDuration:3.0f];
    [sample start:opacityA forKey:self.animationKey];
}

-(IBAction)groupAnimation:(id)sender {
    
    self.animationKey = @"group";
    CAAnimation *moveA = [sample moveAnimationValue:CGPointMake(100,100) withDuration:3.0f];
    CAAnimation *scaleA = [sample scaleAnimationValue:1.3f withDuration:3.0f];
    CAAnimation *opacityA = [sample opacityAnimationValue:0.2f withDuration:3.0f];
    
     NSArray *animations = [NSArray arrayWithObjects:moveA,scaleA,opacityA,nil];
    [sample start:[sample groupAnimationValue:animations withDuration:5.0f] forKey:self.animationKey];
    
}

-(IBAction)wiggleRAnimation:(id)sender {
    
    self.animationKey = @"wiggleR";
    
    CAAnimation *wiggleR = [sample wiggleRotationAnimationValue:5];
    [sample start:wiggleR forKey:self.animationKey];
    
}

-(IBAction)wiggleTAnimation:(id)sender {
    
    self.animationKey = @"wiggleR";
    
    CAAnimation *wiggleT = [sample wiggleTranslationYAnimationValue:5];
    [sample start:wiggleT forKey:self.animationKey];
    
}

-(IBAction)flyingAnimation:(id)sender {
    
    self.animationKey = @"flying";
    
//    CAAnimation *flying = [sample flyImageAnimation];
//    [sample start:flying forKey:self.animationKey];
    
}
    
-(IBAction)spinningAnimation:(id)sender {
    
    self.animationKey = @"spinning";
    
    CAAnimation *spinning = [sample animationForSpinning];
    [sample start:spinning forKey:self.animationKey];
    
}
    
-(IBAction)rotationzAnimation:(id)sender {
    
    self.animationKey = @"rotationz";
    
    CABasicAnimation *rotationz = [sample rotationzAnimation:0.0f:360.f:3.0f:2];
    [sample start:rotationz forKey:self.animationKey];
    
}
    
-(IBAction)rotationxAnimation:(id)sender {
    
    self.animationKey = @"rotationx";
    
    CABasicAnimation *rotationx =  [sample rotationxAnimation:0.0f:360.f:3.0f:2];
    [sample start:rotationx forKey:self.animationKey];
    
}

-(IBAction)rotationyAnimation:(id)sender {
    
    self.animationKey = @"rotationy";
    
    CABasicAnimation *rotationy =  [sample rotationyAnimation:0.0f:360.f:3.0f:2];
    [sample start:rotationy forKey:self.animationKey];
    
}

-(IBAction)shadowEffect:(id)sender {
    sample.shadowEffect = YES;
}

-(IBAction)stopAnimation:(id)sender {
    
    [sample stop:animationKey];
}

-(IBAction)musiAnimation:(id)sender {
    
    [musi haihaiImageAnimation];
}

@end
