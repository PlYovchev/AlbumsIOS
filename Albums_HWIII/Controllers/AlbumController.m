//
//  AlbumController.m
//  Albums_HWIII
//
//  Created by plt3ch on 4/21/15.
//  Copyright (c) 2015 plt3ch. All rights reserved.
//

#import "AlbumController.h"

#define ALBUMS_ARCHIVE_FILE @"albumsData"

@implementation AlbumController

static AlbumController* albumController = nil;

+(id)sharedAlbumController{
    @synchronized(self){
        if (!albumController) {
            albumController = [[AlbumController alloc] init];
        }
    }
    
    return albumController;
}

-(instancetype)init{
    if(albumController){
        [NSException raise:NSInternalInconsistencyException
                    format:@"[%@ %@] cannot be called; use +[%@ %@] instead",
         NSStringFromClass([self class]),
         NSStringFromSelector(_cmd),
         NSStringFromClass([self class]),
         NSStringFromSelector(@selector(sharedAlbumController))];
    }
    else{
        self = [super init];
        if(self){
            _albums = [NSMutableArray array];
            albumController = self;
//            [self populateAlbums];
        }
    }
    
    return albumController;
}

-(void)loadInitialAlbumData{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* dictPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:ALBUMS_ARCHIVE_FILE];
    if([[NSFileManager defaultManager] fileExistsAtPath:dictPath])
    {
        [self extractTheAlbumsData];
    }
    else{
        [self populateAlbums];
    }
}

-(void)populateAlbums{
    Artist* deuce = [[Artist alloc] initWithName:@"Deuce"];
    Song* songOneDeuce = [[Song alloc] initWithName:@"America" andArtists:[NSArray arrayWithObject:deuce] andDuration:246];
    Song* songTwoDeuce = [[Song alloc] initWithName:@"Help me" andArtists:[NSArray arrayWithObject:deuce] andDuration:385];
    NSMutableArray* deuceSongss = [NSMutableArray arrayWithObjects:songOneDeuce,songTwoDeuce, nil];
    Album* albumDeuce = [[Album alloc]initWithName:@"Circle" andArtist:deuce andSongs:deuceSongss andCoverImage:[UIImage imageNamed:@"Circle.jpg"] andYear:2008];
    
    Artist* coldplay = [[Artist alloc] initWithName:@"Coldplay"];
    Song* songOneColdplay = [[Song alloc] initWithName:@"Paradise" andArtists:[NSArray arrayWithObject:coldplay] andDuration:261];
    Song* songTwoColdplay = [[Song alloc] initWithName:@"Clocks" andArtists:[NSArray arrayWithObject:coldplay] andDuration:259];
    NSMutableArray* coldplatSongss = [NSMutableArray arrayWithObjects:songOneColdplay, songTwoColdplay, nil];
    Album* albumColdplay =  [[Album alloc]initWithName:@"Parachutes" andArtist:coldplay andSongs:coldplatSongss andCoverImage:[UIImage imageNamed:@"Coldplay.jpg"]andYear:2010];
    
    Artist* adele = [[Artist alloc] initWithName:@"Adele"];
    Song* songOneAdele = [[Song alloc] initWithName:@"Rain" andArtists:[NSArray arrayWithObject:adele] andDuration:246];
    Song* songTwoAdele = [[Song alloc] initWithName:@"Fire" andArtists:[NSArray arrayWithObject:adele] andDuration:385];
    Song* songThreeAdele = [[Song alloc] initWithName:@"Deep" andArtists:[NSArray arrayWithObject:adele] andDuration:267];
    NSMutableArray* adeleSongss = [NSMutableArray arrayWithObjects:songOneAdele,songTwoAdele,songThreeAdele, nil];
    Album* albumAdele = [[Album alloc]initWithName:@"21" andArtist:adele andSongs:adeleSongss andCoverImage:[UIImage imageNamed:@"Adele.jpg"] andYear:2011];
    
    Artist* sheeran = [[Artist alloc] initWithName:@"Ed Sheeran"];
    Song* songOneSheeran = [[Song alloc] initWithName:@"OK" andArtists:[NSArray arrayWithObject:sheeran] andDuration:212];
    Song* songTwoSheeran = [[Song alloc] initWithName:@"Don't" andArtists:[NSArray arrayWithObject:sheeran] andDuration:199];
    Song* songThreeSheeran = [[Song alloc] initWithName:@"I see fire" andArtists:[NSArray arrayWithObject:sheeran] andDuration:199];
    Song* songFourSheeran = [[Song alloc] initWithName:@"One" andArtists:[NSArray arrayWithObject:sheeran] andDuration:231];
    Song* songFiveSheeran = [[Song alloc] initWithName:@"Sing" andArtists:[NSArray arrayWithObject:sheeran] andDuration:229];
    NSMutableArray* sheeranSongss = [NSMutableArray arrayWithObjects:songOneSheeran,songTwoSheeran,songThreeSheeran,songFourSheeran,songFiveSheeran, nil];
    Album* albumSheeran = [[Album alloc]initWithName:@"X" andArtist:sheeran andSongs:sheeranSongss andCoverImage:[UIImage imageNamed:@"Smashing"] andYear:2012];
    
    [self.albums addObject:albumDeuce];
    [self.albums addObject:albumColdplay];
    [self.albums addObject:albumAdele];
    [self.albums addObject:albumSheeran];
}

#pragma mark - Archiving/Extracting to/from file
-(void)archiveTheAlbumsData{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if ([paths count] > 0)
    {
        NSString* dictPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:ALBUMS_ARCHIVE_FILE];
        [[NSFileManager defaultManager] removeItemAtPath:dictPath error:nil];
        [NSKeyedArchiver archiveRootObject:self.albums toFile:dictPath];
    }
}

-(void)extractTheAlbumsData{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if ([paths count] > 0)
    {
        NSString* dictPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:ALBUMS_ARCHIVE_FILE];
        NSMutableArray* availableVacationExtracted = [NSKeyedUnarchiver unarchiveObjectWithFile:dictPath];
        self.albums = availableVacationExtracted;
    }
}

@end
