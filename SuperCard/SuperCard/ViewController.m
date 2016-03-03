//
//  ViewController.m
//  SuperCard
//
//  Created by Changsong Li on 3/2/16.
//  Copyright © 2016 Uwlax. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet PlayingCardView *PlayingCardView;

@end

@implementation ViewController
- (IBAction)swipe:(UISwipeGestureRecognizer *)sender {
    self.PlayingCardView.faceUp = !self.PlayingCardView.faceUp;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.PlayingCardView.rank = 13;
    self.PlayingCardView.suit = @"♥︎";
    [self.PlayingCardView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.PlayingCardView action:@selector(pinch:)]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
