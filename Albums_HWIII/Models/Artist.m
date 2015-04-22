//
//  Artist.m
//  Albums_HWIII
//
//  Created by plt3ch on 4/21/15.
//  Copyright (c) 2015 plt3ch. All rights reserved.
//

#import "Artist.h"

@implementation Artist

-(instancetype)initWithName:(NSString *)name{
    self = [super init];
    if(self){
        _name = [NSString stringWithString:name];
    }
    
    return self;
}

@end
