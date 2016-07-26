//
//  Public.h
//  JIAOLIAN
//
//  Created by k on 16/4/22.
//  Copyright © 2016年 QIJIA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//正式接口
#define ServerRootPath @""

//测试接口
#define testServerRootPath @""

//正在使用的接口
#define HTTPREQUESTHEADURL @""

#define Save(str) ([str length]==0||[str isEqualToString:@"(null)"])?@"":str  //判断字符串是否为空
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]  //当前的ios版本
#define QJusername @"userName"                  // 用户名  一般为电话号码
#define QJUserHeaderURL @"QJUserHeaderURL"      //用户头像URL
#define QJpassword @"passWord"                  //密码  为验证码
#define QJRealName @"realname"                  // 真实姓名
#define QJPersonCard @"personCard"              //身份证

#define QJLogoutNotification @"QJLogoutNotification" //注销通知
#define QJLoginNotification @"QJLoginNotification" //登陆通知

@interface Public : NSObject

//普通警告框
+(void)showAlertViewWithTitle:(NSString *)title toView:(UIView *)view;

+(id)getUserDefaultWithKey:(NSString *)key;   //根据key 获取user default 的值

+(void)SaveUserDefaultWithValue:(id)value forKey:(NSString *)key; //存键值队进userdefault

+(NSString *)getDocumentWithOwnerPath:(NSString *)path; //加document的新路径

+(NSString *)getUserHeadImagePath; //获取头像的路径

+(UIImage *)getUserHeadImage:(NSString *)userMemberId;  //根据用户Id获取用户头像

+(NSString *)getUserPhotoImagePath:(NSString *)photoName; //获取普通照片路径

+(NSString *)getrealHomePath;   //获取根据手机号,accesstoken区分的文件夹

+(void)writeHeadImgTodocument:(UIImage *)editedImage;    //根据图片写自己的头像入沙盒


@end
