//
//  PlayingCard.m
//  MYAPP
//
//  Created by Changsong Li on 2/24/16.
//  Copyright © 2016 Uwlax.edu. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit; //because changed setter and getter

- (NSString *)contents{
    NSArray *allRanks = [PlayingCard rankString];
    return [allRanks[self.rank] stringByAppendingString: self.suit];
}
- (int)match:(NSArray *) otherCards{
    int score = 0;
    NSMutableArray *copyOtherCards = [otherCards mutableCopy];
    [copyOtherCards addObject:self];
    NSUInteger numOfCards = [copyOtherCards count];
    for (int i = 0; i < numOfCards - 1; i++) {
        for (int j = i+1; j < numOfCards; j++) {
            id card1 = [copyOtherCards objectAtIndex:i];
            id card2 = [copyOtherCards objectAtIndex:j];
            if ([card1 isKindOfClass:[PlayingCard class]]&&[card2 isKindOfClass:[PlayingCard class]]) {
                PlayingCard *playingCard1 = card1;
                PlayingCard *playingCard2 = card2;
                if ([playingCard1.suit isEqualToString:playingCard2.suit]){
                    score += 1;
                }else if(playingCard1.rank == playingCard2.rank){
                    score += 4;
                }
            }
        }
    }
    return score;
}

+ (NSArray *) validSuits{
    return @[@"♠︎",@"♣︎",@"♥︎",@"♦︎"];
}

+ (NSArray *) rankString{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger) maxRank{
    return [[self rankString] count] - 1;
}

-(void) setRank:(NSUInteger)rank{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

-(void) setSuit:(NSString *) suit{
    if ([[PlayingCard validSuits] containsObject: suit]) {
        _suit = suit;
    }
}

-(NSString*) suit{
    return _suit ? _suit : @"?";
}
@end
