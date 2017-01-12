# LSHttpManager
基于AFN3.0以上版本封装的网络框架

/**
*  POST
*/
+ (void)POSTWithURLString:(NSString *)URLString parameters:(id)parameters success:(Success)success failure:(Failure)failure;

/**
*  GET
*/
+ (void)GETWithURLString:(NSString *)URLString parameters:(id)parameters success:(Success)success failure:(Failure)failure;

/**
*  可传请求类型请求
*/
+(void)RequestWithType:(HttpRequestType)type URLString:(NSString *)URLString parameters:(id)parameters success:(Success)success failure:(Failure)failure;


/**
*  开启网络监测
*/
+ (void)startNetWorkMonitoringWithBlock:(NetworkStatusBlock)networkStatusBlock;


/**
*  下载文件
*/
+ (NSURLSessionDownloadTask *)DownLoadFileWithURLString:(NSString *)URLString parameters:(NSDictionary *)parameters savaPath:(NSString *)savePath resumeData:(NSData*)resumeData progress:(UploadDownloadProgress)progress success:(Success)success failure:(Failure)failure;

/**
*  上传视频文件
*/
+ (NSURLSessionDataTask*)UploadVideoWithURLString:(NSString *)URLString parameters:(NSDictionary *)parameters videoPath:(NSString*)videoPath success:(Success)success failur:(Failure)failure progress:(UploadDownloadProgress)progress;

/**
*  上传多张图片
*/
+(NSURLSessionDataTask*)UploadImagesWithURLString:(NSString*)URLString parameters:(NSDictionary *)parameters images:(NSArray*)imageArray success:(Success)success failur:(Failure)failure progress:(UploadDownloadProgress)progress;


/**
*   取消 所有Http 请求
*/
+(void)cancelAllRequest;

/*
*  取消指定 URL 的 Http 请求
*/
+ (void)cancelRequestWithURLString:(NSString *)URLString;


/**
*  是否有网
*/
+ (BOOL)isHaveNetwork;

/**
*  是否是手机网络
*/
+ (BOOL)is3GOr4GNetwork;

/**
*  是否是 WiFi 网络
*/
+ (BOOL)isWiFiNetwork;
