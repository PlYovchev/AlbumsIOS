//
//  Album.m
//  Albums_HWIII
//
//  Created by plt3ch on 4/21/15.
//  Copyright (c) 2015 plt3ch. All rights reserved.
//

#import "Album.h"

@implementation Album

-(instancetype)initWithName:(NSString *)name andArtist:(Artist *)artist andSongs:(NSMutableArray *)songs andCoverImage:(UIImage *)image andYear:(NSInteger)year{
    self = [super init];
    if(self){
        _name = [NSString stringWithString:name];
        _artist = artist;
        _releaseYear = year;
        
        if(!image){
            _coverImage = [UIImage imageNamed:@"PlaceHolder.jpg"];
        }
        else{
             _coverImage = image;
        }
       
        if(!songs){
            _songs = [NSMutableArray array];
        }
        else{
            _songs = [NSMutableArray arrayWithArray:songs];
        }
    }
    
    return self;
}

-(instancetype)initWithName:(NSString *)name andArtist:(Artist *)artist andCoverImage:(UIImage*)image andYear:(NSInteger)year{
    return [self initWithName:name andArtist:artist andSongs:nil andCoverImage:image andYear:year];
}

-(NSInteger)numberOfSongs{
    return [self.songs count];
}

@end
