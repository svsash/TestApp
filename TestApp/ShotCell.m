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
    
    [self.shotLabel setText:_shot.shotTitle];
    [self.shotImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: _shot.shotImageUrl]]]];
}

- (void) setupCellWithFavorite: (Favorite *) favorite
{    
    [self.shotLabel setText:favorite.favTitle];
    [self.shotImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:  favorite.favUrl]]]];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction) addToFavoriteTouchUpInside:(id)sender
{
    [[DataStorage sharedDataStorage] createFavoriteFromShot:_shot];
    
    NSLog(@"%@", [[DataStorage sharedDataStorage] getAllFavorites]);
    
}
@end
