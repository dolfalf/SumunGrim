//  create date :   6/16 
//  last edit   :   7/20
//  author      :   jyon

#import <UIKit/UIKit.h>



@protocol UIStatusFrameViewDelegate
@required
-(void)whenTimeIsUp;    // handle event when time is 0
-(void)whenNoLife;      // handle event when life is 0
@end

@interface UIStatusFrameView : UIView



@property (assign, nonatomic) int gameTime;
@property (retain, nonatomic) NSTimer *gameTimeTimer;

@property (assign, nonatomic) int chanceNumber;

@property (retain, nonatomic) UIImageView *chanceImageView;

#pragma mark - GUI Components

@property (retain, nonatomic) UILabel *timeLabel;
@property (retain, nonatomic) UILabel *chanceLabel;
@property (retain, nonatomic) id<UIStatusFrameViewDelegate> delegate;

#pragma mark - timer handler
- (void) startGameTime;         
- (void) resetGameTime:(int)resetGametime;
- (void) stopGameTime;      // possible to execute startGameTime, after stopGameTime. It means time pause.

#pragma mark - chanceNumber handler
- (void) addChanceNumber;       // Life +1
- (void) minusChanceNumber;     // Life -1
- (void) initChanceNumber:(int)chanceNumber;    //Life reset
- (void) setChanceImage:(UIImage*)image;        //change life image

@end
