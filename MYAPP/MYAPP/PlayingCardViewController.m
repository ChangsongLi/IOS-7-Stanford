//
//  PlayingCardViewController.m
//  MYAPP
//
//  Created by Changsong Li on 2/29/16.
//  Copyright © 2016 Uwlax.edu. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCardDeck.h"
@implementation PlayingCardViewController

-(Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];
}

- (NSAttributedString *)getTitle:(Cards *)card{
    if (card.isChosen) {
        return [[NSAttributedString alloc] initWithString:card.contents];
    }else{
        return [[NSAttributedString alloc] initWithString:@""];
    }
}
@end
