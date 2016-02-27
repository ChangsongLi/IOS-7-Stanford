//
//  Cards.h
//  MYAPP
//
//  Created by Changsong Li on 2/24/16.
//  Copyright © 2016 Uwlax.edu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cards : NSObject

@property (strong,nonatomic) NSString *contents;
@property (nonatomic,getter=isChosen) BOOL chosen;
@property (nonatomic,getter=isMatched) BOOL matched;


//method

- (int)match:(NSArray *) otherCards;


@end