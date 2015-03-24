//
//  WebAPI.m
//  interview
//
//  Created by Brian Chen on 2015/3/24.
//  Copyright (c) 2015年 CCCBTICC. All rights reserved.
//

#import "WebAPI.h"

@implementation WebAPI

+(NSData*)getDataFrom:(NSString*)url{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %li", url, (long)[responseCode statusCode]);
    }
    return responseData;
}

@end
