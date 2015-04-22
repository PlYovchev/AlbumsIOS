//
//  AlbumDetailsViewController.m
//  Albums_HWIII
//
//  Created by plt3ch on 4/22/15.
//  Copyright (c) 2015 plt3ch. All rights reserved.
//

#import "AlbumDetailsViewController.h"
#import "AlbumController.h"
#import "SongTableViewCell.h"

#define SONG_CELL_INDENTIFIER @"SongCellIndentifier"

@interface AlbumDetailsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblAlbumTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewCover;
@property (weak, nonatomic) IBOutlet UILabel *lblAlbumArtist;
@property (weak, nonatomic) IBOutlet UILabel *lblReleasedYear;
@property (weak, nonatomic) IBOutlet UILabel *lblTracksNumber;
@property (weak, nonatomic) IBOutlet UITableView *tableViewSongs;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonEdit;

@end

@implementation AlbumDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateLabels];
    
    self.tableViewSongs.delegate = self;
    self.tableViewSongs.dataSource = self;
}

-(void)viewDidAppear:(BOOL)animated{
    [self updateLabels];
    
    [self.tableViewSongs reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateLabels{
    AlbumController* albumController = [AlbumController sharedAlbumController];
    Album* album = albumController.chosenAlbum;
    self.lblAlbumTitle.text = album.name;
    self.lblAlbumArtist.text = album.artist.name;
    self.lblReleasedYear.text = [NSString stringWithFormat:@"%ld", (long)album.releaseYear];
    self.lblTracksNumber.text = [NSString stringWithFormat:@"%ld", (long)album.numberOfSongs];
    self.imageViewCover.image = album.coverImage;
}

- (IBAction)barButtonEditClick:(id)sender {
    self.tableViewSongs.editing = !self.tableViewSongs.editing;
    
    
    if(self.tableViewSongs.editing){
        [self.barButtonEdit setTitle:@"Done"];
    }
    else{
        [self.barButtonEdit setTitle:@"Edits"];
    }
}

#pragma mark - Tableview data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    AlbumController* albumController = [AlbumController sharedAlbumController];
    Album* album = albumController.chosenAlbum;
    return [album.songs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SongTableViewCell *songCell = [tableView dequeueReusableCellWithIdentifier:SONG_CELL_INDENTIFIER forIndexPath:indexPath];
    
    AlbumController* albumController = [AlbumController sharedAlbumController];
    Album* album = albumController.chosenAlbum;
    Song* song = [album.songs objectAtIndex:indexPath.row];
    
    songCell.lblTrackNumber.text = [NSString stringWithFormat:@"%ld.", indexPath.row + 1];
    songCell.lblSongName.text = [song name];
    
    //Concatenate the names of the artists for the current song with ', ' and display them in 'lblSongArtists'.
    NSMutableArray* artistsNames = [NSMutableArray array];
    for (int i = 0; i < [song.artists count]; i++) {
        [artistsNames addObject:[[song.artists objectAtIndex:i] name]];
    }
    
    NSString* artistsNameSeparatedWithComma = [artistsNames componentsJoinedByString:@", "];
    songCell.lblSongArtists.text = artistsNameSeparatedWithComma;
    
    NSInteger minutes = song.durationInSec / 60;
    NSInteger seconds = song.durationInSec % 60;
    songCell.lblSongDuration.text = [NSString stringWithFormat:@"%ld:%.2ld", (long)minutes, (long)seconds];
    
    return songCell;
}

#pragma mark - TableView delegate

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        AlbumController* albumController = [AlbumController sharedAlbumController];
        Album* album = albumController.chosenAlbum;
        [album.songs removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [self updateLabels];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    AlbumController* albumController = [AlbumController sharedAlbumController];
    Album* album = albumController.chosenAlbum;
    Song* fromSong = [album.songs objectAtIndex:fromIndexPath.row];
    Song* toSong = [album.songs objectAtIndex:toIndexPath.row];
    
    [album.songs removeObjectAtIndex:fromIndexPath.row];
    [album.songs insertObject:toSong atIndex:fromIndexPath.row];
    
    [album.songs removeObjectAtIndex:toIndexPath.row];
    [album.songs insertObject:fromSong atIndex:toIndexPath.row];
    
    [tableView reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
