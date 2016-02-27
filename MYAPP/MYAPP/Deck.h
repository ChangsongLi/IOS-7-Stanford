//
//  Deck.h
//  MYAPP
//
//  Created by Changsong Li on 2/24/16.
//  Copyright © 2016 Uwlax.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cards.h"

@interface Deck : NSObject

- (void)addCard:(Cards *) card atTop:(BOOL)atTop;
- (void)addCard:(Cards *) card;
- (Cards *)drawRandomCard;

@end
