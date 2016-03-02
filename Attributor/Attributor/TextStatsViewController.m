//
//  TextStatsViewController.m
//  Attributor
//
//  Created by Changsong Li on 2/29/16.
//  Copyright © 2016 Uwlax. All rights reserved.
//

#import "TextStatsViewController.h"
@interface TextStatsViewController()

@property (weak, nonatomic) IBOutlet UILabel *colorfulCharacterLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlinedCharacterLabel;

@end
@implementation TextStatsViewController

- (void)setTextToAnalyze:(NSAttributedString *)textToAnalyze{
    _textToAnalyze = textToAnalyze;
    if (self.view.window) [self updateUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)updateUI{
    self.colorfulCharacterLabel.text = [NSString stringWithFormat:@"%td colorful characters", [[self charactersWithAttribute:NSForegroundColorAttributeName]length]];
    self.outlinedCharacterLabel.text = [NSString stringWithFormat:@"%td colorful characters", [[self charactersWithAttribute:NSStrokeWidthAttributeName]length]];
}

- (NSAttributedString *) charactersWithAttribute:(NSString *)attributeName{
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc]init];
    int index = 0;
    while (index < self.textToAnalyze.length) {
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if (value) {
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = (int)(range.location + range.length);
        }else{
            index++;
        }
    }
    return characters;
}

@end
