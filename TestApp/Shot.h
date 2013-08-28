//
//  Shot.h
//  TestApp
//
//  Created by Machine Test on 28.08.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shot : NSObject {
    NSString *shotTitle;
    NSString *shotImageUrl;
}

@property (nonatomic, retain) NSString *shotTitle;
@property (nonatomic, retain) NSString *shotImageUrl;

+ (Shot *) createShotFromDictionary:(NSDictionary *) dict;

@end
