//
//  PlayingCardView.h
//  SuperCard
//
//  Created by Changsong Li on 3/2/16.
//  Copyright © 2016 Uwlax. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSInteger rank;
@property (strong,nonatomic) NSString *suit;
@property (nonatomic) BOOL faceUp;
-(void) pinch:(UIPinchGestureRecognizer *)gesture;
@end
