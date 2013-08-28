//
//  ShotsViewController.m
//  TestApp
//
//  Created by Machine Test on 27.08.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import "ShotsViewController.h"
#import "ShotCell.h" 

@interface ShotsViewController ()

@end

@implementation ShotsViewController

@synthesize ourTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%i %i", indexPath.section, indexPath.row);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *shotCellIdentifier = @"shotCellIdentifier";
    ShotCell *cell = (ShotCell*) [tableView dequeueReusableCellWithIdentifier:shotCellIdentifier] ;
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ShotCell" owner:self options:nil] objectAtIndex:0];
    }
    
    [cell.colorView setBackgroundColor:[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:55.0f/255.0f alpha:1.0f]];
    [cell.shotLabel setText:[NSString stringWithFormat:@"%i", indexPath.row]];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
