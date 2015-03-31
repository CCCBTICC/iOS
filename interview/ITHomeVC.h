//
//  ITHomeVC.h
//  interview
//
//  Created by Dongjie Zhang on 3/21/15.
//  Copyright (c) 2015 CCCBTICC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"
#import "ITQuestionHolder.h"

@interface ITHomeVC : UIViewController <UIScrollViewDelegate>{
    NSMutableArray *arr_question;
}

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;

@end
