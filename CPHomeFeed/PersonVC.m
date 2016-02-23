//
//  PersonVC.m
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/2/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import "PersonVC.h"
#import "PersonController.h"


@interface PersonVC ()

@end

@implementation PersonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    PersonController *personController = [PersonController sharedInstance];
    UILabel *personName = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 200, 30)];
    personName.text = personController.currentPerson;
    [self.view addSubview:personName];
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

@end
