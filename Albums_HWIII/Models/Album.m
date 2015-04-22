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

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_artist forKey:@"artist"];
    [aCoder encodeInteger:_releaseYear forKey:@"releaseYear"];
    
    NSData* imageData = UIImagePNGRepresentation(_coverImage);
    [aCoder encodeObject:imageData forKey:@"imageData"];
    [aCoder encodeObject:_songs forKey:@"songs"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self){
        _name = [aDecoder decodeObjectForKey:@"name"];
        _artist = [aDecoder decodeObjectForKey:@"artist"];
        _releaseYear = [aDecoder decodeIntegerForKey:@"releaseYear"];
        _coverImage = [UIImage imageWithData:[aDecoder decodeObjectForKey:@"imageData"]];
        _songs = [aDecoder decodeObjectForKey:@"songs"];
    }
    
    return self;
}

@end
