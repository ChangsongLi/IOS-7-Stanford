//
//  PlayingCardView.m
//  SuperCard
//
//  Created by Changsong Li on 3/2/16.
//  Copyright © 2016 Uwlax. All rights reserved.
//

#import "PlayingCardView.h"
@interface PlayingCardView()
@property (nonatomic) CGFloat faceCardScalefactor;
@end

@implementation PlayingCardView

@synthesize faceCardScalefactor = _faceCardScalefactor;

-(void)setFaceCardScalefactor:(CGFloat)faceCardScalefactor{
    _faceCardScalefactor = faceCardScalefactor;
    [self setNeedsDisplay];
}

-(CGFloat)faceCardScalefactor{
    if(!_faceCardScalefactor){
        _faceCardScalefactor = 0.9;
    }
    return _faceCardScalefactor;
}
#pragma mark - property
-(void) setSuit:(NSString *)suit{
    if (![_suit isEqualToString:suit]) {
        [self setNeedsDisplay];
    }
    _suit = suit;
}

-(void)setRank:(NSInteger)rank{
    _rank = rank;
    [self setNeedsDisplay];
}

-(void)setFaceUp:(BOOL)faceUp{
    _faceUp = faceUp;
    [self setNeedsDisplay];
}

#pragma mark - Drawing
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


- (NSString *) rankString{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"][self.rank];
}

- (void) drawRect:(CGRect)rect{
    UIBezierPath *roundRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius: [self cornerRadius]];
    [roundRect addClip];
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
    
    [[UIColor blackColor] setStroke];
    [roundRect stroke];
    
    if (self.faceUp) {
        UIImage *faceImage = [UIImage imageNamed: [NSString stringWithFormat:@"%@%@",[self rankString],self.suit]];
        NSLog(@"%@%@",[self rankString],self.suit);
        if (faceImage) {
            CGRect imageRect = CGRectInset(self.bounds,self.bounds.size.width * (1.0 - self.faceCardScalefactor), self.bounds.size.height * (1.0 - self.faceCardScalefactor));
            [faceImage drawInRect:imageRect];
        }else{
            
        }
        [self drawCorners];
    }else{
        [[UIImage imageNamed:@"cardback"] drawInRect:self.bounds];
    }
    
}

-(void) pinch:(UIPinchGestureRecognizer *)gesture{
    if (gesture.state == UIGestureRecognizerStateChanged || gesture.state == UIGestureRecognizerStateEnded) {
        self.faceCardScalefactor *= gesture.scale;
        gesture.scale = 1.0;
    }
}
-(void)drawCorners{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    UIFont *cornerFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    cornerFont = [cornerFont fontWithSize:cornerFont.pointSize * [self cornerScalarFactor]];
    
    NSAttributedString *cornerText = [[NSAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@\n%@",[self rankString],self.suit]  attributes:@{NSFontAttributeName:cornerFont,NSParagraphStyleAttributeName:paragraphStyle}];
    CGRect textBounds;
    textBounds.origin = CGPointMake([self cornerOffset], [self cornerOffset]);
    textBounds.size = [cornerText size];
    [cornerText drawInRect:textBounds];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(context, M_PI);
    [cornerText drawInRect:textBounds];
}

#define CORNER_FONT_STANDARD_HEIGHT 180.00
#define CORNER_RADIUS 12.0

- (CGFloat)cornerScalarFactor{return self.bounds.size.height / CORNER_FONT_STANDARD_HEIGHT;};
- (CGFloat)cornerRadius{return CORNER_RADIUS * [self cornerScalarFactor];};
- (CGFloat)cornerOffset{return [self cornerRadius] / 3.0;};

#pragma mark - Initialization
-(void) setUp{
    self.backgroundColor = nil;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
}

-(void)awakeFromNib{
    [self setUp];
}

@end
