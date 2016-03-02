//
//  SetCard.h
//  MYAPP
//
//  Created by Changsong Li on 3/1/16.
//  Copyright © 2016 Uwlax.edu. All rights reserved.
//

#import "Cards.h"

@interface SetCard : Cards

@property (strong,nonatomic) NSString *shade;
@property (strong,nonatomic) NSString *color;
@property (strong,nonatomic) NSString *character;
@property (nonatomic) int numberCharacter;
+ (NSInteger) maxCharacter;
+ (NSArray *) validCharacter;
+ (NSArray *) validColor;
+ (NSArray *) validShade;
@end
