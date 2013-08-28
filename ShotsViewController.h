//
//  ShotsViewController.h
//  TestApp
//
//  Created by Machine Test on 27.08.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShotsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    IBOutlet UITableView *ourTableView;
}

@property (nonatomic, retain) IBOutlet UITableView *ourTableView;

@end
