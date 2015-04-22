//
//  AlbumDetailsViewController.m
//  Albums_HWIII
//
//  Created by plt3ch on 4/22/15.
//  Copyright (c) 2015 plt3ch. All rights reserved.
//

#import "AlbumDetailsViewController.h"
#import "AlbumController.h"

@interface AlbumDetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lblAlbumTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewCover;
@property (weak, nonatomic) IBOutlet UILabel *lblAlbumArtist;
@property (weak, nonatomic) IBOutlet UILabel *lblReleasedYear;
@property (weak, nonatomic) IBOutlet UILabel *lblTracksNumber;
@property (weak, nonatomic) IBOutlet UITableView *tableViewSongs;

@end

@implementation AlbumDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AlbumController* albumController = [AlbumController sharedAlbumController];
    Album* album = albumController.chosenAlbum;
    self.lblAlbumTitle.text = album.name;
    self.lblAlbumArtist.text = album.artist.name;
    self.lblReleasedYear.text = [NSString stringWithFormat:@"%ld", album.releaseYear];
    self.lblTracksNumber.text = [NSString stringWithFormat:@"%ld", album.numberOfSongs];
    self.imageViewCover.image = album.coverImage;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
