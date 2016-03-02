//
//  SetCard.m
//  MYAPP
//
//  Created by Changsong Li on 3/1/16.
//  Copyright © 2016 Uwlax.edu. All rights reserved.
//

#import "SetCard.h"

@interface SetCard()

@end

@implementation SetCard

-(NSString *)contents{
    NSString *ret = self.character;
    for (int i = 1; i < self.numberCharacter; i++) {
        ret = [ret stringByAppendingString:self.character];
    }
    return ret;
}
- (int)match:(NSArray *) otherCards{
    int score = 0;
    
    if ([[otherCards objectAtIndex:0] isKindOfClass:[SetCard class]] && [[otherCards objectAtIndex:1] isKindOfClass:[SetCard class]]) {
        SetCard *card1 = [otherCards objectAtIndex:0];
        SetCard *card2 = [otherCards objectAtIndex:1];
        
        // same color
        if ([card1.color isEqualToString:card2.color] && [card2.color isEqualToString:self.color]&&[card1.color isEqualToString:self.color]) {
            return 1;
        }
        
        // same character
        if ([card1.character isEqualToString:card2.character] && [card2.character isEqualToString:self.character]&&[card1.character isEqualToString:self.character]) {
            return 1;
        }
        
        // same shade
        if ([card1.shade isEqualToString:card2.shade] && [card2.shade isEqualToString:self.shade]&&[card1.shade isEqualToString:self.shade]) {
            return 1;
        }
        
        // same number of character
        if ( card1.numberCharacter == card2.numberCharacter && card2.numberCharacter == self.numberCharacter && card1.numberCharacter == self.numberCharacter ) {
            return 1;
        }
        
        // different color
        if (![card1.color isEqualToString:card2.color] && ![card2.color isEqualToString:self.color]&&![card1.color isEqualToString:self.color]) {
            return 1;
        }
        
        // different character
        if (![card1.character isEqualToString:card2.character] && ![card2.character isEqualToString:self.character] && ![card1.character isEqualToString:self.character]) {
            return 1;
        }
        
        // different shade
        if (![card1.shade isEqualToString:card2.shade] && ![card2.shade isEqualToString:self.shade] && ![card1.shade isEqualToString:self.shade]) {
            return 1;
        }
        
        // different number of character
        if ( card1.numberCharacter != card2.numberCharacter && card2.numberCharacter != self.numberCharacter && card1.numberCharacter != self.numberCharacter ) {
            return 1;
        }
        
    }
    
    
    return score;
}

static const int MAX_Character = 3;
+ (NSInteger) maxCharacter{
    return MAX_Character;
}

+ (NSArray *) validCharacter{
    return @[@"▲",@"●",@"■"];
}

+ (NSArray *) validColor{
    return @[@"green",@"red",@"purple"];
}

+ (NSArray *) validShade{
    return @[@"solid",@"hollow",@"shade"];
}

- (void) setCharacter:(NSString *)character{
    if ([[SetCard validCharacter] containsObject:character]) {
        _character = character;
    }
}

- (void) setShade:(NSString *)shade{
    if ([[SetCard validShade] containsObject:shade]) {
        _shade = shade;
    }
}

- (void) setColor:(NSString *)color{
    if ([[SetCard validColor] containsObject:color]) {
        _color = color;
    }
}

- (void) setNumberCharacter:(int)numberCharacter{
    if (numberCharacter <= [SetCard maxCharacter]&&numberCharacter >0) {
        _numberCharacter = numberCharacter;
    }
}

@end
