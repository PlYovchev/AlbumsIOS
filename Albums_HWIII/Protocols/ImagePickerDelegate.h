//
//  ImagePickerDelegate.h
//  Albums_HWIII
//
//  Created by plt3ch on 4/22/15.
//  Copyright (c) 2015 plt3ch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ImagePickerDelegate <NSObject>

-(void)onImageChosen:(UIImage*)image;

@end
