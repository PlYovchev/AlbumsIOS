//
//  AlbumTableViewController.m
//  Albums_HWIII
//
//  Created by plt3ch on 4/21/15.
//  Copyright (c) 2015 plt3ch. All rights reserved.
//

#import "AlbumTableViewController.h"
#import "AlbumController.h"
#import "AlbumTableViewCell.h"

#define ALBUM_CELL_INDENTIFIER @"albumCellIndentifier"

@interface AlbumTableViewController ()

@end

@implementation AlbumTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.clearsSelectionOnViewWillAppear = NO;

    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewDidAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    AlbumController* albumController = [AlbumController sharedAlbumController];
    return [albumController.albums count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AlbumTableViewCell *albumCell = [tableView dequeueReusableCellWithIdentifier:ALBUM_CELL_INDENTIFIER forIndexPath:indexPath];
    
    AlbumController* albumController = [AlbumController sharedAlbumController];
    Album* album = [albumController.albums objectAtIndex:indexPath.row];
    
    albumCell.coverImage.image = album.coverImage;
    albumCell.labelAlbumName.text = album.name;
    albumCell.labelArtistName.text = album.artist.name;
    albumCell.labelNumberSongs.text = [NSString stringWithFormat:@"%ld", album.numberOfSongs];
    
    return albumCell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        AlbumController* albumController = [AlbumController sharedAlbumController];
        [albumController.albums removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    AlbumController* albumController = [AlbumController sharedAlbumController];
    Album* fromAlbum = [albumController.albums objectAtIndex:fromIndexPath.row];
    Album* toAlbum = [albumController.albums objectAtIndex:toIndexPath.row];
    
    [albumController.albums removeObjectAtIndex:fromIndexPath.row];
    [albumController.albums insertObject:toAlbum atIndex:fromIndexPath.row];
    
    [albumController.albums removeObjectAtIndex:toIndexPath.row];
    [albumController.albums insertObject:fromAlbum atIndex:toIndexPath.row];
    
    [tableView reloadData];
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AlbumController* albumController = [AlbumController sharedAlbumController];
    Album* album = [albumController.albums objectAtIndex:indexPath.row];
    albumController.chosenAlbum = album;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
