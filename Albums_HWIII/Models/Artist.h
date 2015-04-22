//
//  Artist.h
//  Albums_HWIII
//
//  Created by plt3ch on 4/21/15.
//  Copyright (c) 2015 plt3ch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artist : NSObject <NSCoding>

@property (nonatomic, copy) NSString* name;

-(instancetype)initWithName:(NSString*)name;

@end
