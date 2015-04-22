//
//  AddAlbumViewController.m
//  Albums_HWIII
//
//  Created by plt3ch on 4/21/15.
//  Copyright (c) 2015 plt3ch. All rights reserved.
//

#import "AddAlbumViewController.h" 
#import "ImagePickerDelegate.h"
#import "ImagesTableViewController.h"
#import "AlbumController.h"

#define BUTTON_ADD_COVER_TEXT @"Click here to add picture"

@interface AddAlbumViewController () <UITextFieldDelegate, ImagePickerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtFieldAlbumName;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldAlbumArtist;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldReleaseYear;
@property (weak, nonatomic) IBOutlet UIButton *btnAddAlbum;
@property (weak, nonatomic) IBOutlet UIButton *btnAddCoverImage;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewCover;

@end

@implementation AddAlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self validateTextFields];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onImageChosen:(UIImage *)image{
    self.imageViewCover.image = image;
    if(image){
        [self.btnAddCoverImage setTitle: @"" forState: UIControlStateNormal];
    }
}

- (IBAction)btnAddAlbumClick:(id)sender {
    NSString* albumName = self.txtFieldAlbumName.text;
    Artist* artist = [[Artist alloc] initWithName:self.txtFieldAlbumArtist.text];
    NSInteger year = [self.txtFieldReleaseYear.text integerValue];
    
    Album* album = [[Album alloc] initWithName:albumName andArtist:artist andCoverImage:self.imageViewCover.image andYear:year];
    
    AlbumController* albumController = [AlbumController sharedAlbumController];
    [albumController.albums addObject:album];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnClearClick:(id)sender {
    self.txtFieldReleaseYear.text = @"";
    self.txtFieldAlbumName.text = @"";
    self.txtFieldAlbumArtist.text = @"";
    self.imageViewCover.image = nil;
    [self.btnAddCoverImage setTitle: BUTTON_ADD_COVER_TEXT forState: UIControlStateNormal];
    self.btnAddAlbum.enabled = NO;
}

#pragma mark - TextField Validation

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if([textField isEqual:self.txtFieldReleaseYear]){
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

- (IBAction)textFieldEditingChanged:(id)sender {
    [self validateTextFields];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField;  {
    [textField resignFirstResponder];
    return YES;
}

-(void)validateTextFields{
    bool textFieldEmpty = false;
    if([self.txtFieldAlbumArtist.text length] == 0){
        textFieldEmpty = true;
    }
    if([self.txtFieldAlbumName.text length] == 0){
        textFieldEmpty = true;
    }
    if([self.txtFieldReleaseYear.text length] == 0){
        textFieldEmpty = true;
    }
    
    if(textFieldEmpty){
        self.btnAddAlbum.enabled = NO;
    }
    else{
        self.btnAddAlbum.enabled = YES;
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"AddImageSegue"]){
        ImagesTableViewController* destController = segue.destinationViewController;
        destController.delegate = self;
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
