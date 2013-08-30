//
//  DataStorage.h
//  TestApp
//
//  Created by Machine Test on 28.08.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreData/CoreData.h>

#import "Shot.h"

#import "Favorite.h"

@interface DataStorage : NSObject

+ (DataStorage *)sharedDataStorage;

- (Favorite *) createFavoriteFromShot: (Shot *)shot;

- (void) removeFavorite:(Favorite *)favorite;

- (NSArray *) getAllFavorites;

@end