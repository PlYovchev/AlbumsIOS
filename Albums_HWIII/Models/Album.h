//
//  Album.h
//  Albums_HWIII
//
//  Created by plt3ch on 4/21/15.
//  Copyright (c) 2015 plt3ch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Artist.h"
#import "Song.h"

@interface Album : NSObject

@property (nonatomic, copy) NSString* name;
@property (nonatomic) Artist* artist;
@property (nonatomic, copy) NSMutableArray* songs;
@property (nonatomic) UIImage* coverImage;
@property (nonatomic) NSInteger releaseYear;
@property (readonly, nonatomic) NSInteger numberOfSongs;

-(instancetype)initWithName:(NSString*)name andArtist:(Artist*)artist andSongs:(NSMutableArray*)songs andCoverImage:(UIImage*)image andYear:(NSInteger)year;
-(instancetype)initWithName:(NSString*)name andArtist:(Artist*)artist andCoverImage:(UIImage*)image andYear:(NSInteger)year;

@end
