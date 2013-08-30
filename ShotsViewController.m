//
//  ShotsViewController.m
//  TestApp
//
//  Created by Machine Test on 27.08.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import "ShotsViewController.h"
#import "ShotCell.h"

@interface ShotsViewController (){
    NSMutableArray  *shotsArray;
}

@end

@implementation ShotsViewController

@synthesize ourTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setupData];
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) setupData
{
    AppDelegate *appDelegate = ((AppDelegate *)[[UIApplication sharedApplication] delegate]);
    
    shotsArray = [[NSMutableArray alloc] initWithArray: appDelegate.shotsArray];
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
    
    [cell setupCellWithShot:[shotsArray objectAtIndex:indexPath.row]];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return shotsArray.count;
}

#pragma mark - memory

- (void) dealloc
{
    [ourTableView release];
    [shotsArray release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
