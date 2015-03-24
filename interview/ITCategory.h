//
//  ITCategory.h
//  interview
//
//  Created by Brian Chen on 2015/3/24.
//  Copyright (c) 2015年 CCCBTICC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ITCategory : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    NSArray * question_list;
    NSArray * tag_list;
}

@end
