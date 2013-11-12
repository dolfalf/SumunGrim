


#import "UIStatusFrameView.h"

@implementation UIStatusFrameView

@synthesize gameTime = _gameTime;
@synthesize gameTimeTimer = _gameTimeTimer;

@synthesize chanceNumber = _chanceNumber;

@synthesize timeLabel = _timeLabel;
@synthesize chanceLabel = _chanceLabel;

@synthesize delegate = _delegate;

@synthesize chanceImageView = _chanceImageView;


#pragma mark - handling gameTime

- (void) displayGameTime:(int)setGameTime{
    
    self.timeLabel.text = [NSString stringWithFormat:@"%d",setGameTime];
    
}

- (void) gameTimeTimerHandler{
    
    self.gameTime--;
    
    if (self.gameTime <= 0){
        [self.delegate whenTimeIsUp];
        [self stopGameTime];
    }
    
    [self displayGameTime:self.gameTime];
    
}

- (void) startGameTime{
    
    if (self.gameTimeTimer == nil){
        
        self.gameTimeTimer = [NSTimer scheduledTimerWithTimeInterval:1 
                                                              target:self 
                                                            selector:@selector(gameTimeTimerHandler) 
                                                            userInfo:nil 
                                                             repeats:YES];
        
        [self displayGameTime:self.gameTime];
        self.chanceLabel.text = [NSString stringWithFormat:@" x %d", self.chanceNumber];
        
    }
    
}

- (void) resetGameTime:(int) resetGametime{
    
    [self.gameTimeTimer invalidate];
    self.gameTime = resetGametime;
    
    [self displayGameTime:self.gameTime];
}


- (void) stopGameTime{
    
    [self.gameTimeTimer invalidate];
    self.gameTimeTimer = Nil;
    
}


#pragma mark - handling chance

- (void) addChanceNumber{
    self.chanceNumber++;
    self.chanceLabel.text = [NSString stringWithFormat:@" x %d", self.chanceNumber];
}

- (void) minusChanceNumber{
    self.chanceNumber--;
    self.chanceLabel.text = [NSString stringWithFormat:@" x %d", self.chanceNumber];
    if(self.chanceNumber <= 0){
        [self.delegate whenNoLife];
    }
    
}

// override
- (void)initChanceNumber:(int)chanceNumber{
    self.chanceNumber = chanceNumber;
    self.chanceLabel.text = [NSString stringWithFormat:@" x %d", chanceNumber];
}

- (void) setChanceImage:(UIImage*)image{
    self.chanceImageView.image = image;
}



#pragma mark - View Class method

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        NSLog(@"initWithFrame");
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 80, 60)];
        self.timeLabel.backgroundColor = [UIColor clearColor];
        self.timeLabel.textColor = [UIColor whiteColor];
        self.timeLabel.text = @"time";
        self.timeLabel.font = [UIFont fontWithName:@"Arial" size:50];                  
        self.timeLabel.minimumFontSize = 20.0;
        
        // Initialization code
        [self addSubview:self.timeLabel];
        
        
        UIImageView *iv = self.chanceImageView;
        iv = [[[UIImageView alloc] initWithFrame:CGRectMake(220, 10, 60, 60)] autorelease]; 
        iv.image = [UIImage imageNamed:@"heart1.jpeg"];
        iv.backgroundColor = [UIColor clearColor];
        [self addSubview:iv];
        
        
        self.chanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(270, 10, 30, 60)];
        self.chanceLabel.text = @"chance x ?";
        
        [self addSubview:self.chanceLabel];
        
    }
    return self;
}





#pragma mark - GUI Components


- (void) dealloc{
    
    self.timeLabel = Nil;
    self.chanceLabel = Nil;
    self.chanceImageView = Nil;
    
    self.delegate = Nil;
    
    [super dealloc];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
