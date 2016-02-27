//
//  ViewController.m
//  MYAPP
//
//  Created by Changsong Li on 2/5/16.
//  Copyright © 2016 Uwlax.edu. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) Deck *deck;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameModeSegmentControl;
@property (strong,nonatomic) CardMatchingGame *game;
@end

@implementation ViewController

-(CardMatchingGame *)game{
    if (!_game) {
        _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    }
    return _game;
}

-(Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    [self.gameModeSegmentControl setEnabled:NO];
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void)updateUI{
    for (UIButton *button in self.cardButtons) {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:button];
        Cards *card = [self.game cardAtIndex:cardIndex];
        [button setTitle:[self getTitle:card] forState:UIControlStateNormal];
        [button setBackgroundImage:[self getBackground:card] forState:UIControlStateNormal];
        button.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score : %td",self.game.score];
}
- (IBAction)touchButtonResetGame:(UIButton *)sender {
    self.game = nil;
    [self updateUI];
    [self.gameModeSegmentControl setEnabled:YES];
}
- (IBAction)switchToChangeHowManyCardMatch:(UISegmentedControl *)sender {
    NSUInteger index = sender.selectedSegmentIndex;
    if (index == 0) {
        [self.game setGameModeMatchHowManyCard:2];
    }else{
        [self.game setGameModeMatchHowManyCard:3];
    }
}

- (NSString *)getTitle:(Cards *)card{
    if (card.isChosen) {
        return card.contents;
    }else{
        return @"";
    }
}

- (UIImage *)getBackground:(Cards *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}


@end
