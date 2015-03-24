//
//  ITHomeVC.m
//  interview
//
//  Created by Dongjie Zhang on 3/21/15.
//  Copyright (c) 2015 CCCBTICC. All rights reserved.
//

#import "ITHomeVC.h"

@interface ITHomeVC ()

@end

@implementation ITHomeVC
@synthesize scrollView, pageControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIColor *white = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0];
    NSMutableDictionary *navBarTextAttributes = [NSMutableDictionary dictionaryWithCapacity:1];
    [navBarTextAttributes setObject:white forKey:NSForegroundColorAttributeName ];
    self.navigationController.navigationBar.titleTextAttributes = navBarTextAttributes;

    UIImageView *back = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    back.image = [UIImage imageNamed:@"home_back.png"];
    [self.view insertSubview:back atIndex:0];
    
    scrollView.layer.cornerRadius = 10.0f;
    scrollView.layer.masksToBounds = YES;
    
    arr_question = [[NSMutableArray alloc] init];
    for (int i = 0; i<10; i++) {
        [arr_question addObject:[NSString stringWithFormat:@"question%d", i]];
    }
    
    for (int i = 0; i < [arr_question count]; i++) {
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
        
        UILabel *lbl = [[UILabel alloc] initWithFrame:frame];
        lbl.text = [arr_question objectAtIndex:i];
        [self.scrollView addSubview:lbl];
    }
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * [arr_question count], scrollView.frame.size.height);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

#pragma mark login api manager

-(void)requestForGetTopQuestions:(NSDictionary*)info{
   
}

@end
