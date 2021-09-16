//
//  AXViewController.m
//  AXSocialShareUI
//
//  Created by axinger on 09/16/2021.
//  Copyright (c) 2021 axinger. All rights reserved.
//

#import "AXViewController.h"
@import AXSocialShareUI;
@import ReactiveObjC;
@interface AXViewController ()

@end

@implementation AXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIButton *btn = [UIButton.alloc initWithFrame:CGRectMake(100, 100, 200, 50)];
    btn.backgroundColor = UIColor.redColor;
    [btn setTitle:@"默认分享UI" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(showShare:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)showShare:(id)sender {
    AXSocialShareViewController *vc = AXSocialShareViewController.alloc.init;
    
    [self presentViewController:vc animated:YES completion:nil];
//    vc.deleate = self;
    
    
}


-(void)socialShareViewController:(AXSocialShareViewController *)vc
                  didShareOption:(AXSocialShareOption *)option {
    NSLog(@"vc=%@,option=%@",vc,option);
}



@end
