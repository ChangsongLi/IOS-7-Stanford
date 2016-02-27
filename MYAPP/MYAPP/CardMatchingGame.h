//
//  CardMatchingGame.h
//  MYAPP
//
//  Created by Changsong Li on 2/24/16.
//  Copyright © 2016 Uwlax.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//designated initializer
-(instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
-(void)chooseCardAtIndex:(NSInteger)index;
-(Cards *)cardAtIndex:(NSUInteger)index;
-(void)setGameModeMatchHowManyCard:(NSUInteger) matchHowManyCard;


@property (nonatomic,readonly)NSInteger score;

@end
