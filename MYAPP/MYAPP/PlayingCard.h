//
//  PlayingCard.h
//  MYAPP
//
//  Created by Changsong Li on 2/24/16.
//  Copyright © 2016 Uwlax.edu. All rights reserved.
//

#import "Cards.h"

@interface PlayingCard : Cards

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSArray *) rankString;
+ (NSUInteger) maxRank;
@end
