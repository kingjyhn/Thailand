//
//  SettingsManager.m
//  MobileKPI
//
//  Created by Wang Xiaolong on 12-9-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SettingsManager.h"

@implementation SettingsManager

static NSString *fileName = @"appConfig.plist";
static NSString *backwardKey = @"backwardnumber";

-(id)init
{
    if (self = [super init]) {
        isChange = YES;
    }
    return self;
}

-(void)setBackwardNum:(int)backwardNumber
{
    if (backwardNumber>0) {
        backwardNum = backwardNumber;
        NSMutableDictionary *temp = [self getSettingsData]; 
        [temp setValue:[NSString stringWithFormat:@"%d",backwardNum] forKey:backwardKey];
        [temp writeToFile:[self getFile] atomically:YES];
        isChange = YES;
        NSLog(@"修改参数成功");
    }
}

-(NSInteger)backwardNum
{
    if (isChange) {
        NSString *tempString = [[self getSettingsData]objectForKey:backwardKey];
        backwardNum = [tempString intValue];
        isChange = NO;
        return backwardNum;
    }else {
        return backwardNum;
    }
}

- (NSMutableDictionary *) getSettingsData {  
    
    NSMutableDictionary *settings = [[[NSMutableDictionary alloc] initWithContentsOfFile: [self getFile]]autorelease];  
    NSLog(@"%d",[settings count]);
    return settings;
} 

- (NSString *)getFile
{
    
    NSString *documentDirectory = [self getDocumentDirectory];   
    NSString *finalPath = [documentDirectory stringByAppendingPathComponent: fileName];
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:finalPath]) {
		NSError *error;
		if (![fileManager copyItemAtPath:sourcePath toPath:finalPath error:&error]) {
			
			NSLog(@"%@",[error localizedDescription]);
            return @"";
		}
	}	
	[fileManager release];
    return finalPath;
}


- (NSString *)getDocumentDirectory {  
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);  
    return [paths objectAtIndex: 0];  
} 

@end
