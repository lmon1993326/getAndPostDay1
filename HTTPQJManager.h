//
//  HTTPQJManager.h
//  JIAOLIAN
//
//  Created by k on 16/4/22.
//  Copyright © 2016年 QIJIA. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

//定义block 成功与失败的block
typedef void(^HTTPRequestSuccess)(AFHTTPRequestOperation *request, id data);
typedef void(^HTTPRequestFail)(AFHTTPRequestOperation *request, NSError *error);

#import <Foundation/Foundation.h>

@interface HTTPQJManager : AFHTTPRequestOperationManager

//创建post请求
- (AFHTTPRequestOperation *)createPostWithAction:(NSString *)action parameters:(NSDictionary *)parameter success:(HTTPRequestSuccess)success failure:(HTTPRequestFail)failure;

//创建get请求
- (AFHTTPRequestOperation *)createGetWithAction:(NSString *)action parameters:(NSDictionary *)parameter success:(HTTPRequestSuccess)success failure:(HTTPRequestFail)failure;

//单例
+ (HTTPQJManager *)shareHTTPQJManager;

- (AFHTTPRequestOperation *)queryFileFromUrl:(NSString *)url success:(HTTPRequestSuccess)success failure:(HTTPRequestFail)failure;

@end
