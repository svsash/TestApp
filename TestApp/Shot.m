//
//  Shot.m
//  TestApp
//
//  Created by Machine Test on 28.08.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import "Shot.h"

@implementation Shot

@synthesize shotTitle, shotImageUrl, shotId;

+ (Shot *) createShotFromDictionary:(NSDictionary *) dict
{
    Shot *shot = [[Shot alloc] init];
    
    shot.shotTitle = [dict objectForKey:@"title"];
    shot.shotImageUrl = [dict objectForKey:@"image_url"];
    shot.shotId = [dict objectForKey:@"id"];
    
    return shot;
}



@end
