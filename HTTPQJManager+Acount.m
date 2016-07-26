//
//  HTTPQJManager+Acount.m
//  JIAOLIAN
//
//  Created by k on 16/4/22.
//  Copyright © 2016年 QIJIA. All rights reserved.
//

#import "HTTPQJManager+Acount.h"
#import "Public.h"

@implementation HTTPQJManager (Acount)

#pragma mark 用户登录
-(AFHTTPRequestOperation *)createUserLoginRequestFrom:(NSString *)userTel passsword:(NSString *)password successFinsh:(HTTPRequestSuccess)success requestFail:(HTTPRequestFail)failure{

    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    if(userTel)
        [parameters setObject:userTel forKey:@"tel"];
    
    if(password)
        [parameters setObject:password forKey:@"validCode"];
    
    return [self createPostWithAction:HTTPRequestLogin parameters:parameters success:success failure:failure];
}

#pragma mark 注册详情
-(AFHTTPRequestOperation *)postUserRegisterInformationRequestFromrealName:(NSString *)realName passsword:(NSString *)password identity:(NSString *)identity gender:(NSString *)gender experienceYears:(NSString *)experienceYears city:(NSString *)city teachSubjects:(NSString *)teachSubjects homeAddress:(NSString *)homeAddress workAddress:(NSString *)workAddress identityPhoto:(NSString *)identityPhoto driversLicense:(NSString *)driversLicense  proCoachCard:(NSString *)proCoachCard carPhoto:(NSString *)carPhoto drivingLicenseType:(NSString *)drivingLicenseType tel:(NSString *)tel successFinsh:(HTTPRequestSuccess)success requestFail:(HTTPRequestFail)failure{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    if (tel) {
        [parameters setObject:tel forKey:@"tel"];
    }

    if (realName) {
        [parameters setObject:realName forKey:@"realName"];
    }
    if (password) {
        [parameters setObject:password forKey:@"password"];
    }
    if (identity) {
        [parameters setObject:identity forKey:@"identity"];
    }
    if (experienceYears) {
        [parameters setObject:experienceYears forKey:@"experienceYears"];
    }
    if (city) {
        [parameters setObject:city forKey:@"city"];
    }
    if (teachSubjects) {
        [parameters setObject:teachSubjects forKey:@"teachSubjects"];
    }
    if (homeAddress) {
        [parameters setObject:homeAddress forKey:@"homeAddress"];
    }
    if (workAddress) {
        [parameters setObject:workAddress forKey:@"workAddress"];
    }
    if (identityPhoto) {
        NSURL *fileUrl = [NSURL fileURLWithPath:identityPhoto];
        [parameters setObject:fileUrl forKey:@"identityPhoto"];
    }
    if (driversLicense) {
        NSURL *fileUrl = [NSURL fileURLWithPath:driversLicense];
        [parameters setObject:fileUrl forKey:@"driversLicense"];
    }
    if (proCoachCard) {
        NSURL *fileUrl = [NSURL fileURLWithPath:proCoachCard];
        [parameters setObject:fileUrl forKey:@"proCoachCard"];
    }
    if (carPhoto) {
        NSURL *fileUrl = [NSURL fileURLWithPath:carPhoto];
        [parameters setObject:fileUrl forKey:@"carPhoto"];
    }
    if (drivingLicenseType) {
        [parameters setObject:drivingLicenseType forKey:@"drivingLicenseType"];
    }
    return [self createPostWithAction:HTTPRequestRegister parameters:parameters success:success failure:failure];
}

@end
