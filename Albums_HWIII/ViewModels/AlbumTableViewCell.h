//
//  AlbumTableViewCell.h
//  Albums_HWIII
//
//  Created by plt3ch on 4/21/15.
//  Copyright (c) 2015 plt3ch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *coverImage;
@property (weak, nonatomic) IBOutlet UILabel *labelAlbumName;
@property (weak, nonatomic) IBOutlet UILabel *labelArtistName;
@property (weak, nonatomic) IBOutlet UILabel *labelNumberSongs;

@end
