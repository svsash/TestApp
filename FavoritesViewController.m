//
//  FavoritesViewController.m
//  TestApp
//
//  Created by Machine Test on 27.08.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import "FavoritesViewController.h"

@interface FavoritesViewController ()
{
    NSMutableArray *favoritesArray;
}
@end

@implementation FavoritesViewController

@synthesize favoritesTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setupData];
    }
    return self;
}

- (void) setupData
{
    favoritesArray = [[NSMutableArray alloc] init];
    if (favoritesArray <= 0) {
        favoritesArray = [NSMutableArray arrayWithArray:[[DataStorage sharedDataStorage] getAllFavorites]];
//    }else{
//        if (favoritesArray.count > 0) {
//        [favoritesArray removeAllObjects];
//        }
       
//        favoritesArray = [NSMutableArray arrayWithArray:[[DataStorage sharedDataStorage] getAllFavorites]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupData];
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%i %i", indexPath.section, indexPath.row);
}

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
    
    [cell setupCellWithFavorite:[favoritesArray objectAtIndex:indexPath.row]];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return favoritesArray.count;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
