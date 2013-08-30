//
//  ShotCell.h
//  TestApp
//
//  Created by Machine Test on 27.08.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Shot.h"

#import "Favorite.h"

@interface ShotCell : UITableViewCell {
    IBOutlet UIImageView *shotImageView;
    
    IBOutlet UILabel *shotLabel;
    
    IBOutlet UIButton *addFavoriteButton;
    IBOutlet UIButton *removeFavoriteButton;
    
    Shot        *_shot;
    Favorite    *_favorite;
}

@property (nonatomic, retain) IBOutlet UIImageView *shotImageView;

@property (nonatomic, retain) IBOutlet UILabel *shotLabel;

@property (nonatomic, retain) IBOutlet UIButton *addFavoriteButton;
@property (nonatomic, retain) IBOutlet UIButton *removeFavoriteButton;

- (void) setupCellWithShot: (Shot *) shot;

- (void) setupCellWithFavorite: (Favorite *) favorite;

- (IBAction) addToFavoriteTouchUpInside:(id)sender;

- (IBAction) removeFavoriteTouchUpInside:(id)sender;

@end