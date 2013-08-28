//
//  DownloadShots.m
//  TestApp
//
//  Created by Machine Test on 28.08.13.
//  Copyright (c) 2013 AleksandrP. All rights reserved.
//

#import "DownloadShots.h"

#import "Shot.h"

static DownloadShots *_sharedData = nil;

@implementation DownloadShots

+ (DownloadShots *)sharedStorage
{
    if (!_sharedData) {
        _sharedData = [[DownloadShots alloc] init];
    }
    return _sharedData;
}

- (id)init
{
    if (self = [super init]) {
        if (deliveredData != nil) {
            deliveredData = nil;
        }
        deliveredData = [[NSMutableData alloc] init];
    }
    return self;
}

-(void) requestForShots
{
    NSURL *postURL = [NSURL URLWithString:@"http://api.dribbble.com/shots/everyone?per_page=50"];
    
	NSURLRequest * request = [NSURLRequest requestWithURL:postURL];
	NSURLConnection * connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
	[connection start];
//    [postURL release];
//    [request release];
//    [connection release];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [deliveredData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [deliveredData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    deliveredData = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [[DownloadShots sharedStorage] downloadFinished];
}

-(void)downloadFinished
{
    NSError *error = nil;
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData: deliveredData
                                                         options: kNilOptions
                                                           error: &error];
    
    NSArray *shots = [json objectForKey:@"shots"];
    
    for (int i = 0; i < shots.count; i++) {
        NSDictionary *dict = [[NSDictionary alloc]initWithObjectsAndKeys:[[shots objectAtIndex:i] objectForKey:@"title"], @"title", [[shots objectAtIndex:i] objectForKey:@"image_url"], @"image_url", nil];
        Shot * newShot = [Shot createShotFromDictionary:dict];
        
        NSLog(@"newShot.shotTitle: %@", newShot.shotTitle);
        
        NSLog(@"newShot.shotImageUrl: %@", newShot.shotImageUrl);
    }
}
@end
