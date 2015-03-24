//
//  ITRightMenuVC.m
//  interview
//
//  Created by Dongjie Zhang on 3/21/15.
//  Copyright (c) 2015 CCCBTICC. All rights reserved.
//

#import "ITRightMenuVC.h"

@interface ITRightMenuVC ()

@end

@implementation ITRightMenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *back = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    back.image = [UIImage imageNamed:@"menu_back.png"];
    [self.view insertSubview:back atIndex:0];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btn_go_pressed:(id)sender {
    [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"cataVC"]] animated:YES];
    [self.sideMenuViewController hideMenuViewController];
}
@end
