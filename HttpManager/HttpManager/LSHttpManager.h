//
//  LSHttpManager.h
//  至美直播
//
//  Created by 刘松 on 2017/1/16.
//  Copyright © 2017年 liusong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HttpManager.h"

@interface LSHttpManager :HttpManager



+(void)POST:(NSString *)URLString parameters:(id)parameters success:(Success)success failure:(Failure)failure;

+( void)TGUploadImagesWithURLString:(NSString *)URLString parameters:(NSDictionary *)parameters images:(NSArray *)imageArray success:(Success)success failur:(Failure)failure progress:(UploadDownloadProgress)progress;
+(NSURLSessionDownloadTask *)TGDownLoadFileWithURLString:(NSString *)URLString parameters:(NSDictionary *)parameters savaPath:(NSString *)savePath resumeData:(NSData *)resumeData success:(Success)success failure:(Failure)failure progress:(UploadDownloadProgress)progress;

@end
