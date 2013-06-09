//
//  PathHelper.m
//  StrategicMap
//
//  Created by WanC on 13-5-20.
//  Copyright (c) 2013年 wxl. All rights reserved.
//

#import "PathHelper.h"

@implementation PathHelper

+(NSString*)getSandBoxPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

+(NSString*)getLoacalImagesPath
{
    NSString *documentsDirectory = [self getSandBoxPath];
    NSString *imageDir = [documentsDirectory stringByAppendingPathComponent:@"images"];
    return imageDir;
}

@end
