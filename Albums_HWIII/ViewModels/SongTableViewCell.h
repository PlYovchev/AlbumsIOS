//
//  SongTableViewCell.h
//  Albums_HWIII
//
//  Created by plt3ch on 4/22/15.
//  Copyright (c) 2015 plt3ch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblTrackNumber;
@property (weak, nonatomic) IBOutlet UILabel *lblSongName;
@property (weak, nonatomic) IBOutlet UILabel *lblSongArtists;
@property (weak, nonatomic) IBOutlet UILabel *lblSongDuration;

@end
