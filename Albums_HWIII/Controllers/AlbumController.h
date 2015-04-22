//
//  AlbumController.h
//  Albums_HWIII
//
//  Created by plt3ch on 4/21/15.
//  Copyright (c) 2015 plt3ch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"

@interface AlbumController : NSObject

@property (nonatomic) Album* chosenAlbum;
@property (nonatomic) NSMutableArray* albums;

+(id)sharedAlbumController;

@end
