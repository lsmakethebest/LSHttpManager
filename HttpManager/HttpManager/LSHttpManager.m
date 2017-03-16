

//
//  LSHttpManager.m
//  至美直播
//
//  Created by 刘松 on 2017/1/16.
//  Copyright © 2017年 liusong. All rights reserved.
//

#import "LSHttpManager.h"

#define StringFormat(a,b) [NSString stringWithFormat:@"%@%@",a,b]
#define BASE_URL @""

@implementation LSHttpManager


+(void)POST:(NSString *)URLString parameters:(id)parameters success:(Success)success failure:(Failure)failure
{
    [self POSTWithURLString:StringFormat(BASE_URL, URLString) parameters:parameters success:^(NSDictionary *response) {
        if (success) {
            NSLog(@"请求结果:%@",response);
            success(response);
        }
    } failure:^(NSError *error) {
        if (failure) {
            NSLog(@"请求失败:%@",error.localizedDescription);
            failure(error);
        }
    }];
}



+(void )TGUploadImagesWithURLString:(NSString *)URLString parameters:(NSDictionary *)parameters images:(NSArray *)imageArray success:(Success)success failur:(Failure)failure progress:(UploadDownloadProgress)progress
{
    [self UploadImagesWithURLString:URLString parameters:parameters images:imageArray success:^(NSDictionary *response) {
        if (success) {
            NSLog(@"请求结果:%@",response);
            success(response);
        }
    } failur:^(NSError *error) {
        if (failure) {
            NSLog(@"请求失败:%@",error.localizedDescription);
            failure(error);
        }
    } progress:^(CGFloat progressValue) {
       
        if (progress) {
            progress(progressValue);
        }
    }];
}

+(NSURLSessionDownloadTask *)TGDownLoadFileWithURLString:(NSString *)URLString parameters:(NSDictionary *)parameters savaPath:(NSString *)savePath resumeData:(NSData *)resumeData success:(Success)success failure:(Failure)failure progress:(UploadDownloadProgress)progress
{
   return [self DownLoadFileWithURLString:URLString parameters:parameters savaPath:nil resumeData:resumeData success:^(NSDictionary *response) {
       if (success) {
           NSLog(@"请求结果:%@",response);
           success(response);
       }
   } failure:^(NSError *error) {
       if (failure) {
           NSLog(@"请求失败:%@",error.localizedDescription);
           failure(error);
       }
   } progress:^(CGFloat progressValue) {
       if (progress) {
           progress(progressValue);
       }
   }];    
}



+(NSDictionary *)getCookieDictionary
{
   NSMutableDictionary *dic= [NSMutableDictionary dictionary];
    dic[@"fsd"]=@"fsdfsd";
    return dic;
}
+(NSDictionary *)getPublicParams
{
    NSMutableDictionary *dic= [NSMutableDictionary dictionary];
    dic[@"ios"]=@"1";
    dic[@"systemVersion"]=@"10.2";
    return dic;
}


@end
