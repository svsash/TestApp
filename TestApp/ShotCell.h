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
    
    Shot *_shot;
}

@property (nonatomic, retain) IBOutlet UIImageView *shotImageView;

@property (nonatomic, retain) IBOutlet UILabel *shotLabel;

- (void) setupCellWithShot: (Shot *) shot;

- (void) setupCellWithFavorite: (Favorite *) favorite;

- (IBAction) addToFavoriteTouchUpInside:(id)sender;

@end
