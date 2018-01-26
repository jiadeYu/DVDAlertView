//
//  ViewController.m
//  DVDAlertView
//
//  Created by jiade yu on 2018/1/25.
//  Copyright © 2018年 BraveTime. All rights reserved.
//

#import "ViewController.h"
#import "DVDAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)showAlertViewAction:(id)sender
{
    RIButtonItem * makeSureItem = [RIButtonItem itemWithLabel:@"确定" action:^{
        NSLog(@"click on makeSure");
    }];
    RIButtonItem * cancleItem = [RIButtonItem itemWithLabel:@"取消" action:^{
        NSLog(@"click on cancel");
    }];
    DVDAlertView * alertView = [[DVDAlertView alloc]initWithTitle:@"" message:@"这是一个自定义的AlertView" cancelButtonItem:cancleItem otherButtonItems:makeSureItem];
    [alertView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
