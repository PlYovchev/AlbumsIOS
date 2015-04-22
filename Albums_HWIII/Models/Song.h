//
//  Song.h
//  Albums_HWIII
//
//  Created by plt3ch on 4/21/15.
//  Copyright (c) 2015 plt3ch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Artist.h"

@interface Song : NSObject <NSCoding>

@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSArray* artists; //The artists are stored in an array because single song can be collaboration between more than one artists.
@property (nonatomic) NSInteger durationInSec;

-(instancetype)initWithName:(NSString*)name andArtists:(NSArray*) artists andDuration:(NSInteger)durationInSeconds;

@end
