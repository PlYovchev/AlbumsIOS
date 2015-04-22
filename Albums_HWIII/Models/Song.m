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

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_artists forKey:@"artists"];
    [aCoder encodeInteger:_durationInSec forKey:@"durationInSec"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self){
        _name = [aDecoder decodeObjectForKey:@"name"];
        _artists = [aDecoder decodeObjectForKey:@"artists"];
        _durationInSec = [aDecoder decodeIntegerForKey:@"durationInSec"];
    }
    
    return self;
}

@end
