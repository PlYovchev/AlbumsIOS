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

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_name forKey:@"name"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self){
        _name = [aDecoder decodeObjectForKey:@"name"];
    }
    
    return self;
}

@end
