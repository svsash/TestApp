//
//  FavoritesViewController.h
//  TestApp
//
//  Created by Machine Test on 27.08.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ShotCell.h"

#import "DataStorage.h"

@interface FavoritesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *favoritesTableView;
}

@property (nonatomic, retain) IBOutlet UITableView *favoritesTableView;

@end
