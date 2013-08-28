//
//  ShotCell.h
//  TestApp
//
//  Created by Machine Test on 27.08.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShotCell : UITableViewCell {
    IBOutlet UIView *colorView;
    IBOutlet UILabel *shotLabel;
}

@property (nonatomic, retain) IBOutlet UIView *colorView;
@property (nonatomic, retain) IBOutlet UILabel *shotLabel;

@end
