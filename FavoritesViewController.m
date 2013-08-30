//
//  FavoritesViewController.m
//  TestApp
//
//  Created by Machine Test on 27.08.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import "FavoritesViewController.h"

@implementation FavoritesViewController

@synthesize favoritesTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self addNotifications];
    }
    return self;
}

- (void) addNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadTable)
                                                 name:@"RemoveFavoriteNeedReloadTable"
                                               object:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self reloadTable];
}

- (void) reloadTable
{
    [favoritesTableView reloadData];
}

#pragma mark - TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300.;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *shotCellIdentifier = @"shotCellIdentifier";
    ShotCell *cell = (ShotCell*) [tableView dequeueReusableCellWithIdentifier:shotCellIdentifier] ;
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ShotCell" owner:self options:nil] objectAtIndex:0];
    }
    
    [cell setupCellWithFavorite:[[[DataStorage sharedDataStorage] getAllFavorites] objectAtIndex:indexPath.row]];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    int count = [[[DataStorage sharedDataStorage] getAllFavorites] count];
    return count;
}

#pragma mark - memory

- (void) dealloc
{
    [favoritesTableView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
