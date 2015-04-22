//
//  ImagesTableViewController.h
//  Albums_HWIII
//
//  Created by plt3ch on 4/22/15.
//  Copyright (c) 2015 plt3ch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImagePickerDelegate.h"

@interface ImagesTableViewController : UITableViewController

@property (nonatomic, weak) id <ImagePickerDelegate> delegate;

@end
