//
//  ImagesTableViewController.m
//  Albums_HWIII
//
//  Created by plt3ch on 4/22/15.
//  Copyright (c) 2015 plt3ch. All rights reserved.
//

#import "ImagesTableViewController.h"
#import "CoverImageTableViewCell.h"

#define IMAGE_CELL_INDENTIFIER @"CoverImageCell"

@interface ImagesTableViewController ()

@property (nonatomic) NSArray* images;

@end

@implementation ImagesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage* imageOne = [UIImage imageNamed:@"Adele.jpg"];
    UIImage* imageTwo = [UIImage imageNamed:@"Circle.jpg"];
    UIImage* imageThree = [UIImage imageNamed:@"Coldplay.jpg"];
    UIImage* imageFour = [UIImage imageNamed:@"DevilsGun.jpg"];
    UIImage* imageSix = [UIImage imageNamed:@"Smashing.jpg"];
    UIImage* imageSeven = [UIImage imageNamed:@"TheDoggfather.jpg"];
    UIImage* imageEight = [UIImage imageNamed:@"Wings.jpg"];
    
    self.images = [NSArray arrayWithObjects:imageOne, imageTwo, imageThree, imageFour, imageSix, imageSeven, imageEight, nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.images count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CoverImageTableViewCell *coverImageCell = [tableView dequeueReusableCellWithIdentifier:IMAGE_CELL_INDENTIFIER forIndexPath:indexPath];
    
    coverImageCell.imageViewCover.image = [self.images objectAtIndex:indexPath.row];
    
    return coverImageCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIImage* image = [self.images objectAtIndex:indexPath.row];
    [self.navigationController popViewControllerAnimated:YES];
    [self.delegate onImageChosen:image];
}

@end
