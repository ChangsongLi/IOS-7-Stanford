//
//  SetGameViewController.m
//  MYAPP
//
//  Created by Changsong Li on 3/1/16.
//  Copyright © 2016 Uwlax.edu. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetGameViewController
-(Deck *)createDeck{
    return [[SetCardDeck alloc]init];
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.game setGameModeMatchHowManyCard:3];
}

- (NSAttributedString *)getTitle:(Cards *)card{
    UIColor *color;
    if ([card isKindOfClass:[SetCard class]]) {
        SetCard *setCard = (SetCard *)card;
        if ([setCard.color isEqualToString:@"red"]) {
            color = [UIColor redColor];
        }else if ([setCard.color isEqualToString:@"green"]) {
            color = [UIColor greenColor];
        }else{
            color = [UIColor purpleColor];
        }
        if ([setCard.shade isEqualToString:@"hollow"]) {
            return [[NSAttributedString alloc] initWithString:card.contents  attributes: @{ NSForegroundColorAttributeName : [UIColor whiteColor],NSStrokeColorAttributeName: color,NSStrokeWidthAttributeName: @-10}];
        }else if([setCard.shade isEqualToString:@"solid"]){
            return [[NSAttributedString alloc] initWithString:card.contents  attributes: @{ NSForegroundColorAttributeName : color}];
        }else{
            return [[NSAttributedString alloc] initWithString:card.contents  attributes: @{ NSForegroundColorAttributeName : [UIColor blackColor],NSStrokeColorAttributeName: color,NSStrokeWidthAttributeName: @-10}];
        }
    }
    return nil;
}

- (UIImage *)getBackground:(Cards *)card{
    return [UIImage imageNamed:card.isChosen ? @"blackCard" : @"cardfront"];
}

@end
