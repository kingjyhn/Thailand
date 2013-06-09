//
//  FirstViewController.m
//  Thailand
//
//  Created by WanC on 13-6-5.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "FirstViewController.h"
#import "EGOPhotoGlobal.h"
#import "PathHelper.h"

@interface FirstViewController ()

- (IBAction)tap:(id)sender;

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"first";
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tap:(id)sender {
    NSArray *images = [NSArray arrayWithObjects:@"1.png",@"2.png",@"3.png", nil];
    [self showInfoPhotos:images];
}

-(void)showInfoPhotos:(NSArray*)files
{
    NSMutableArray *photos = [[NSMutableArray alloc] init];
    for (NSString *imageName in files) {
        NSString *imagePath = [PathHelper getLoacalImagesPath];
        imagePath = [imagePath stringByAppendingPathComponent:imageName];
        EGOQuickPhoto *photo = [[EGOQuickPhoto alloc] initWithImage:[UIImage imageWithContentsOfFile:imagePath]];
        [photos addObject:photo];
    }
    if ([photos count] == 0) {
        return;
    }
    EGOQuickPhotoSource *source = [[EGOQuickPhotoSource alloc] initWithPhotos:photos];
    EGOPhotoViewController *photoController = [[EGOPhotoViewController alloc] initWithPhotoSource:source];
    photoController.title = @"photo";
    [self.navigationController pushViewController:photoController animated:YES];
    //[self presentViewController:photoController animated:YES completion:^{}];
}

@end
