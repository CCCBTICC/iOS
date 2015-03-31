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
    arr_question = [[NSMutableArray alloc] init];
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
    for (int i = 0; i < 10; i++) {
        UITextView *tv_desc = [[UITextView alloc] init];
        tv_desc.tag = i*10+1;
        tv_desc.backgroundColor = [UIColor clearColor];
        UILabel *lbl_tag = [[UILabel alloc] init];
        lbl_tag.tag = i*10+2;
        [self.scrollView addSubview:tv_desc];
        [self.scrollView addSubview:lbl_tag];
    }
    [self requestForGetTopQuestions];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews{
    for (int i = 0; i < [arr_question count]; i++) {
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i+5;
        frame.origin.y = 0;
        frame.size.width = self.scrollView.frame.size.width-10;
        frame.size.height = self.scrollView.frame.size.height*0.75;
        
        CGRect frameTag = CGRectMake(frame.origin.x, frame.origin.y+frame.size.height, frame.size.width, self.scrollView.frame.size.height*0.25);
        UITextView *tv_desc = (UITextView*)[self.scrollView viewWithTag:i*10+1];
        tv_desc.frame = frame;
        UILabel *lbl_tag = (UILabel*)[self.scrollView viewWithTag:i*10+2];
        lbl_tag.frame = frameTag;
    }
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * [arr_question count], scrollView.frame.size.height);

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

-(void)requestForGetTopQuestions{
    
    NSString *postStr = [NSString stringWithFormat:@"%@%@",URL_MAIN, URL_GETLIST];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:postStr]];
    [request setHTTPMethod:@"GET"];
    NSHTTPURLResponse *requestResponse;
    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
    
    NSString *requestReply = [[NSString alloc] initWithBytes:[requestHandler bytes] length:[requestHandler length] encoding:NSASCIIStringEncoding];
    SBJSON *parser = [[SBJSON alloc] init];
    NSArray *arr_reply = [parser objectWithString:requestReply error:nil];
    NSInteger code = [requestResponse statusCode];
    if (code == 200) {
        for (NSDictionary* dic in arr_reply) {
            ITQuestionHolder *dHolder = [ITQuestionHolder new];
            dHolder.str_id = [dic objectForKey:@"_id"];
            dHolder.str_description = [dic objectForKey:@"description"];
            dHolder.arr_tag = [dic objectForKey:@"tags"];
            [arr_question addObject:dHolder];
        }
        [self refreshScrollView];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Interview" message:@"Cannot connect to server" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

-(void)refreshScrollView{
    for (int i = 0; i < [arr_question count]; i++) {
        UITextView *tv_desc = (UITextView*)[self.scrollView viewWithTag:i*10+1];
        ITQuestionHolder* dHolder = [arr_question objectAtIndex:i];
        tv_desc.text = dHolder.str_description;
        UILabel *lbl_tag = (UILabel*)[self.scrollView viewWithTag:i*10+2];
        NSString *str_tag = @"";
        for (NSString *str in dHolder.arr_tag) {
            str_tag = [str_tag stringByAppendingString:[NSString stringWithFormat:@"#%@ ", str]];
        }
        lbl_tag.text = str_tag;
    }
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * [arr_question count], scrollView.frame.size.height);
}

@end
