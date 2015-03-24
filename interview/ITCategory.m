//
//  ITCategory.m
//  interview
//
//  Created by Brian Chen on 2015/3/24.
//  Copyright (c) 2015年 CCCBTICC. All rights reserved.
//

#import "ITCategory.h"
#import "WebAPI.h"

@interface ITCategory ()

@end

@implementation ITCategory

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSData * data = [WebAPI getDataFrom:SERVER_URL];
    NSArray * list = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%@", question_list);
    
    for(NSDictionary * i in list){
        [i objectForKey:@"name"];
        
        NSLog(@"%@", [i objectForKey:@"name"]);
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return question_list.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
