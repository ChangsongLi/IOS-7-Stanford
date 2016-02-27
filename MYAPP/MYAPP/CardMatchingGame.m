//
//  CardMatchingGame.m
//  MYAPP
//
//  Created by Changsong Li on 2/24/16.
//  Copyright © 2016 Uwlax.edu. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()
@property (nonatomic,readwrite)NSInteger score;
@property (nonatomic,strong) NSMutableArray *cards; // of Cards
//default game mode: is matching 2 card, could chang it by method.
@property (nonatomic) NSUInteger matchHowManyCard;
@end

@implementation CardMatchingGame

-(NSMutableArray *)cards{
    if (!_cards) {
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

-(instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    
    if (self) {
        self.matchHowManyCard = 2;
        for (int i = 0; i < count; i++) {
            Cards *card = [deck drawRandomCard];
            
            if (card) {
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

-(instancetype) init{
    return nil;
}

static const int PENALTY_MISMATCH = 2;
static const int PENALTY_CHOSE = 1;
static const int BONUS_CHOSE = 4;

-(void)chooseCardAtIndex:(NSInteger)index{
    Cards *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        }else{
            [self chooseCardReactionByDifferentGameMode:card];
            self.score -= PENALTY_CHOSE;
            card.chosen = YES;
        }
    }
}

-(void)chooseCardReactionByDifferentGameMode:(Cards *)card{
    NSUInteger needNumOfCard = self.matchHowManyCard - 1;
    NSUInteger countNumOfCardChosen = 0;
    NSMutableArray *cardsChosen = [[NSMutableArray alloc]init];
    
    for (Cards *othercard in self.cards) {
        if (othercard.isChosen && !othercard.isMatched) {
            countNumOfCardChosen++;
            [cardsChosen addObject:othercard];
            if (countNumOfCardChosen == needNumOfCard) {
                int matchingScore = [card match:cardsChosen];
                if (matchingScore) {
                    self.score += matchingScore * BONUS_CHOSE;
                    for (Cards *cardInArray in cardsChosen) {
                        cardInArray.matched = YES;
                    }
                    card.matched = YES;
                }else{
                    for (Cards *cardInArray in cardsChosen) {
                        cardInArray.chosen = NO;
                    }
                    self.score -= PENALTY_MISMATCH;
                }
                break;
            }
        }
    }
}

-(void)setGameModeMatchHowManyCard:(NSUInteger) matchHowManyCard{
    self.matchHowManyCard = matchHowManyCard;

}

-(Cards *)cardAtIndex:(NSUInteger)index{
    return index < [self.cards count] ? self.cards[index] : nil;
}

@end
