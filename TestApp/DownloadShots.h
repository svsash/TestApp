//
//  DownloadShots.h
//  TestApp
//
//  Created by Machine Test on 28.08.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownloadShots : NSObject {
    NSMutableData *deliveredData;
}

- (void) requestForShots;
+ (DownloadShots *)sharedStorage;

@end
