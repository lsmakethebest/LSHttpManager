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


@property(nonatomic,strong) NSData *data;

@property(nonatomic,strong) NSURLSessionDownloadTask *task;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;

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

- (IBAction)download:(id)sender {
    [self.pauseButton setTitle:@"暂停" forState:UIControlStateNormal];
    self.task= [HttpManager DownLoadFileWithURLString:@"http://www.itiapp.cn/zhimei/php/driver.ipa" parameters:nil savaPath:nil resumeData:nil progress:^(CGFloat progress) {
                NSLog(@"下载进度：%f%%",progress);
            } success:^(NSDictionary *response) {
        
            } failure:^(NSError *error) {
                
            }];
}
- (IBAction)pauseOrResume:(UIButton*)sender {
    
    if ([sender.currentTitle isEqualToString:@"暂停"]) {
        [self.task cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
            self.data=resumeData;
        }];
        [sender setTitle:@"继续" forState:UIControlStateNormal];
    }else{
        self.task= [HttpManager DownLoadFileWithURLString:@"http://www.itiapp.cn/zhimei/php/driver.ipa" parameters:nil savaPath:nil resumeData:self.data progress:^(CGFloat progress) {
            NSLog(@"下载进度：%f%%",progress);
        } success:^(NSDictionary *response) {
            
        } failure:^(NSError *error) {
            
        }];
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
    }
    
}



@end
