//
//  SetCardDeck.m
//  MYAPP
//
//  Created by Changsong Li on 3/1/16.
//  Copyright © 2016 Uwlax.edu. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

- (instancetype) init{
    self = [super init];
    
    if (self) {
        for (NSString *character in [SetCard validCharacter]) {
            for (NSString *shade in [SetCard validShade]) {
                for (NSString *color in [SetCard validColor]) {
                    for (int num = 1; num <= [SetCard maxCharacter]; num++) {
                        SetCard *card = [[SetCard alloc]init];
                        card.character = character;
                        card.shade = shade;
                        card.color = color;
                        card.numberCharacter = num;
                        [self addCard:card];
                    }
                }
            }
        }
    }
    
    return self;
}

@end
