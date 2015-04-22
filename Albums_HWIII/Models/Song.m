//
//  Song.m
//  Albums_HWIII
//
//  Created by plt3ch on 4/21/15.
//  Copyright (c) 2015 plt3ch. All rights reserved.
//

#import "Song.h"

@implementation Song

-(instancetype)initWithName:(NSString *)name andArtists:(NSArray *)artists andDuration:(NSInteger)durationInSeconds{
    self = [super init];
    if(self){
        _name = [NSString stringWithString:name];
        _artists = [NSArray arrayWithArray:artists];
        _durationInSec = durationInSeconds;
    }
    
    return self;
}

@end
