//
//  ViewController.m
//  HttpManager
//
//  Created by 刘松 on 2017/1/12.
//  Copyright © 2017年 liusong. All rights reserved.
//

#import "ViewController.h"

#import "LSHttpManager.h"

@interface ViewController ()


@property(nonatomic,strong) NSData *data;

@property(nonatomic,strong) NSURLSessionDownloadTask *task;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [LSHttpManager startNetWorkMonitoringWithBlock:^(NetworkStatus status) {
        
    }];
}

- (IBAction)click:(id)sender {

    [LSHttpManager POSTWithURLString:@"http://101.201.78.184:8005/carrierAPI/snsInfoAction/queryBanner" parameters:nil success:^(NSDictionary *response) {
        NSLog(@"%@",response);
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];

}

- (IBAction)download:(id)sender {
    [self.pauseButton setTitle:@"暂停" forState:UIControlStateNormal];
    self.task= [LSHttpManager TGDownLoadFileWithURLString:@"http://www.itiapp.cn/zhimei/php/driver.ipa" parameters:nil savaPath:nil resumeData:nil success:^(NSDictionary *response) {
        
    } failure:^(NSError *error) {
        
    } progress:^(CGFloat progressValue) {
        NSLog(@"下载进度：%f%%",progressValue);
    }];

}
- (IBAction)pauseOrResume:(UIButton*)sender {
    
    if ([sender.currentTitle isEqualToString:@"暂停"]) {
        [self.task cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
            self.data=resumeData;
        }];
        [sender setTitle:@"继续" forState:UIControlStateNormal];
    }else{
        self.task=[LSHttpManager TGDownLoadFileWithURLString:@"http://www.itiapp.cn/zhimei/php/driver.ipa" parameters:nil savaPath:nil resumeData:self.data success:^(NSDictionary *response) {
            
        } failure:^(NSError *error) {
            
        } progress:^(CGFloat progressValue) {
            NSLog(@"下载进度：%f%%",progressValue);
        }];
        
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
        
        
    }
    
}

- (IBAction)cancelALL:(id)sender {
    
    [LSHttpManager cancelAllRequest];
}


@end
