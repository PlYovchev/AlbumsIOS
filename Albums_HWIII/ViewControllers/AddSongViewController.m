//
//  AddSongViewController.m
//  Albums_HWIII
//
//  Created by plt3ch on 4/22/15.
//  Copyright (c) 2015 plt3ch. All rights reserved.
//

#import "AddSongViewController.h"
#import "AlbumController.h"

#define ARTIST_CELL_INDENTIFIER @"ArtistCellIndentifier"

@interface AddSongViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *txtFieldSongName;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldSongDuration;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldArtist;
@property (weak, nonatomic) IBOutlet UITableView *tableViewArtists;
@property (weak, nonatomic) IBOutlet UIButton *btnAddSong;

@property (nonatomic) NSMutableArray* songArtists;

@end

@implementation AddSongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.songArtists = [NSMutableArray array];
    
    self.tableViewArtists.dataSource = self;
    self.tableViewArtists.delegate = self;
    
    AlbumController* albumController = [AlbumController sharedAlbumController];
    Album* album = albumController.chosenAlbum;
    self.txtFieldArtist.text = album.artist.name;
    
    [self validateFields];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnAddArtistToSongClick:(id)sender {
    if([self.txtFieldArtist.text length] != 0){
        Artist* artist = [[Artist alloc] initWithName:self.txtFieldArtist.text];
        [self.songArtists addObject:artist];
        [self.tableViewArtists reloadData];
        [self validateFields];
        
        self.txtFieldArtist.text = @"";
    }
}

- (IBAction)btnAddSongClick:(id)sender {
    Song* song = [[Song alloc] initWithName:self.txtFieldSongName.text andArtists:self.songArtists andDuration:[self.txtFieldSongDuration.text integerValue]];
    AlbumController* albumController = [AlbumController sharedAlbumController];
    Album* album = albumController.chosenAlbum;
    [album.songs addObject:song];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)textFieldEditingChanged:(id)sender {
    [self validateFields];
}

-(void)validateFields{
    bool anyFieldEmpty = false;
    if([self.txtFieldSongName.text length] == 0){
        anyFieldEmpty = true;
    }
    
    if([self.txtFieldSongDuration.text length] == 0){
        anyFieldEmpty = true;
    }
    
    if([self.songArtists count] == 0){
        anyFieldEmpty = true;
    }
    
    if(anyFieldEmpty){
        self.btnAddSong.enabled = NO;
    }
    else{
        self.btnAddSong.enabled = YES;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if([textField isEqual:self.txtFieldSongDuration]){
        NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
        for (int i = 0; i < [string length]; i++) {
            unichar c = [string characterAtIndex:i];
            if (![myCharSet characterIsMember:c]) {
                return NO;
            }
        }
    }
    
    return YES;
}

#pragma mark - TableView data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.songArtists count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ARTIST_CELL_INDENTIFIER];
    
    cell.textLabel.text = [self.songArtists[indexPath.row] name];
    
    return cell;
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
