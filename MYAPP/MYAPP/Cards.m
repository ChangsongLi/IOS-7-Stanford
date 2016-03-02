//
//  Cards.m
//  MYAPP
//
//  Created by Changsong Li on 2/24/16.
//  Copyright © 2016 Uwlax.edu. All rights reserved.
//

#import "Cards.h"

@implementation Cards

- (int)match:(NSArray *) otherCards{
    int score = 0;
    
    for (Cards *card in otherCards ) {
        if ([card.contents isEqualToString:self.contents]) {
            score++;
        }
    }
    return score;
}

@end
