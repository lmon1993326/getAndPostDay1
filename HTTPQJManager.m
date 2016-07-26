//
//  HTTPQJManager.m
//  JIAOLIAN
//
//  Created by k on 16/4/22.
//  Copyright © 2016年 QIJIA. All rights reserved.
//

#import "HTTPQJManager.h"
#import "Public.h"

@implementation HTTPQJManager

//单例创建数据
+(HTTPQJManager *)shareHTTPQJManager{
    
    static HTTPQJManager *hTTPQJManager;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        hTTPQJManager = [[HTTPQJManager alloc]init];
        hTTPQJManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        hTTPQJManager.requestSerializer.timeoutInterval = 20;
    });
    return hTTPQJManager;
}

#pragma mark 创建post请求

-(NSString *)joinURL:(NSString *)URLStr{
    
    return [NSString stringWithFormat:@"%@%@",HTTPREQUESTHEADURL,URLStr];

}

-(AFHTTPRequestOperation *)createPostWithAction:(NSString *)action parameters:(NSDictionary *)parameter success:(HTTPRequestSuccess)success failure:(HTTPRequestFail)failure{

    //NSLog(@"%@",[self joinURL:action]);
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    if (parameter) {
        [params addEntriesFromDictionary:parameter];
    }
    NSString *postUrl = [self joinURL:action];
    
    return [super POST:postUrl parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //NSLog(@"得到数据:%@",operation.responseString);
        
        NSString *str = [NSString stringWithString:operation.responseString];
        NSData *data = [[NSData alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding]];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        if (success) {
            success(operation,resultDic);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            failure(operation,error);
        }
    }];
}

#pragma mark get请求
-(AFHTTPRequestOperation *)createGetWithAction:(NSString *)action parameters:(NSDictionary *)parameter success:(HTTPRequestSuccess)success failure:(HTTPRequestFail)failure{

    //NSLog(@"%@",[self joinURL:action]);
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    if (parameter) {
        [params addEntriesFromDictionary:parameter];
    }
    NSString *getUrl = [self joinURL:action];
    
    return [super GET:getUrl parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *str = [NSString stringWithString:operation.responseString];
        //NSLog(@"获得数据：%@", str);
        
        NSData *data = [[NSData alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding]];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        if (success) {
            success(operation,resultDic);
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            
            failure(operation,error);
        }
        
    }];
}

-(AFHTTPRequestOperation *)queryFileFromUrl:(NSString *)url success:(HTTPRequestSuccess)success failure:(HTTPRequestFail)failure{
    
    return [super GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        NSString *str = [NSString stringWithString:operation.responseString];
        
        
        NSData *data = [[NSData alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding]];
        
        if (success) {
            success(operation,data);
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            
            failure(operation,error);
        }
        
    }];
}


@end
