//
//  WebAPI.h
//  interview
//
//  Created by Brian Chen on 2015/3/24.
//  Copyright (c) 2015年 CCCBTICC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebAPI : NSObject

+(NSData*)getDataFrom:(NSString*)url;

@end
