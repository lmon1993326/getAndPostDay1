//
//  HTTPQJManager+Acount.h
//  JIAOLIAN
//
//  Created by k on 16/4/22.
//  Copyright © 2016年 QIJIA. All rights reserved.
//

#import "HTTPQJManager.h"

#define HTTPRequestLogin       @""   //用户登录

#define HTTPRequestRegister        @""   //用户注册(电话)



@interface HTTPQJManager (Acount)

//登录
-(AFHTTPRequestOperation *)createUserLoginRequestFrom:(NSString *)userTel passsword:(NSString *)password successFinsh:(HTTPRequestSuccess)success requestFail:(HTTPRequestFail)failure;

//注册详情
-(AFHTTPRequestOperation *)postUserRegisterInformationRequestFromrealName:(NSString *)realName passsword:(NSString *)password identity:(NSString *)identity gender:(NSString *)gender experienceYears:(NSString *)experienceYears city:(NSString *)city teachSubjects:(NSString *)teachSubjects homeAddress:(NSString *)homeAddress workAddress:(NSString *)workAddress identityPhoto:(NSString *)identityPhoto driversLicense:(NSString *)driversLicense  proCoachCard:(NSString *)proCoachCard carPhoto:(NSString *)carPhoto drivingLicenseType:(NSString *)drivingLicenseType tel:(NSString *)tel successFinsh:(HTTPRequestSuccess)success requestFail:(HTTPRequestFail)failure;



@end
