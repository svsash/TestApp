//
//  Favorite.h
//  TestApp
//
//  Created by Machine Test on 29.08.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Favorite : NSManagedObject

@property (nonatomic, retain) NSString * favTitle;
@property (nonatomic, retain) NSString * favUrl;
@property (nonatomic, retain) NSString * favId;

@end
