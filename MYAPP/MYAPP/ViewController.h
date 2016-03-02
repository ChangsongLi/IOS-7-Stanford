//
//  ViewController.h
//  MYAPP
//
//  Created by Changsong Li on 2/5/16.
//  Copyright © 2016 Uwlax.edu. All rights reserved.
//
//  abstract class

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "CardMatchingGame.h"

@interface ViewController : UIViewController
@property (strong,nonatomic) CardMatchingGame *game;
-(Deck *)createDeck; // abstract method
- (NSAttributedString *)getTitle:(Cards *)card;// abstract method
@end
