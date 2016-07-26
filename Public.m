//
//  Public.m
//  JIAOLIAN
//
//  Created by k on 16/4/22.
//  Copyright © 2016年 QIJIA. All rights reserved.
//

#import "Public.h"

@implementation Public

+(void)showAlertViewWithTitle:(NSString *)title toView:(UIView *)view{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:title delegate:view cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [view addSubview:alertView];
    [alertView show];
}

+(void)SaveUserDefaultWithValue:(id)value forKey:(NSString *)key{

    if (!value) {
        return;
    }
    NSUserDefaults *us = [NSUserDefaults standardUserDefaults];
    [us setObject:value forKey:key];
    [us synchronize];
}

+(id)getUserDefaultWithKey:(NSString *)key{
    NSUserDefaults *us = [NSUserDefaults standardUserDefaults];
    
    if ([[NSString stringWithFormat:@"%@",[us objectForKey:key]] isEqualToString:@"(null)"]) {
        return @"";
    }
    return [us objectForKey:key];
}

+(NSString *)getDocumentWithOwnerPath:(NSString *)path{
    NSString *documentsDirectory = [NSHomeDirectory()stringByAppendingString:@"Documents"];
    NSString *returnPath = [documentsDirectory stringByAppendingPathComponent:path];
   
    return returnPath;
}

+(NSString *)getUserHeadImagePath{
    NSString *path = [self getrealHomePath];
    
    NSString *headPath = [path stringByAppendingString:@"/userHead.png"];
    return headPath;
}

+(NSString *)getUserPhotoImagePath:(NSString *)photoName{
    NSString *path = [self getrealHomePath];
    NSString *str = [NSString stringWithFormat:@"/%@,png",photoName];
    NSString *imagePath = [path stringByAppendingString:str];
    
    return imagePath;
}


+(NSString *)getrealHomePath{
    NSString *firstPath = [NSString stringWithFormat:@"%@/%@",[Public getUserDefaultWithKey:QJusername],[self getUserDefaultWithKey:QJACCESS_TOKEN]];
    
    NSString *path = [Public getDocumentWithOwnerPath:firstPath];
    return path;
}


@end
