//
//  ViewController.m
//  HttpManager
//
//  Created by 刘松 on 2017/1/12.
//  Copyright © 2017年 liusong. All rights reserved.
//

#import "ViewController.h"

#import "HttpManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [HttpManager startNetWorkMonitoringWithBlock:^(NetworkStatus status) {
        
    }];
}

- (IBAction)click:(id)sender {
    
    [HttpManager POSTWithURLString:@"http://101.201.78.184:8005/carrierAPI/snsInfoAction/queryBanner" parameters:nil success:^(NSDictionary *response) {
        NSLog(@"%@",response);
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];

}


@end
