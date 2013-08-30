//
//  ShotCell.m
//  TestApp
//
//  Created by Machine Test on 27.08.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import "ShotCell.h"

#import "DataStorage.h"

@implementation ShotCell

@synthesize shotImageView, shotLabel;
@synthesize addFavoriteButton, removeFavoriteButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) setupCellWithShot: (Shot *) shot
{
    _shot = shot;
    
    [self.addFavoriteButton setHidden:NO];
    [self.removeFavoriteButton setHidden:YES];
    
    [self.shotLabel setText:_shot.shotTitle];
    [self.shotImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: _shot.shotImageUrl]]]];
}

- (void) setupCellWithFavorite: (Favorite *) favorite
{
    _favorite = favorite;
    
    [self.addFavoriteButton setHidden:YES];
    [self.removeFavoriteButton setHidden:NO];
    
    [self.shotLabel setText:_favorite.favTitle];
    [self.shotImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_favorite.favUrl]]]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (IBAction) addToFavoriteTouchUpInside:(id)sender
{
    [[DataStorage sharedDataStorage] createFavoriteFromShot:_shot];
}

- (IBAction) removeFavoriteTouchUpInside:(id)sender
{
    [[DataStorage sharedDataStorage] removeFavorite:_favorite];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RemoveFavoriteNeedReloadTable"
                                                        object:nil];
}

@end
