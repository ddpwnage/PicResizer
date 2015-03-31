//
//  picturePreview.m
//  PicResizer
//
//  Created by Danny Dalton on 3/30/15.
//  Copyright (c) 2015 Dannydalton.com. All rights reserved.
//

#import "picturePreview.h"
#import "picturePreviewScene.h"
#import <SceneKit/SceneKit.h>

@implementation picturePreview

-(id)initWithFrame:(CGRect)frame {
    NSLog(@"initWithFrame called in picturePreview...");
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    picturePreviewScene* pps;
    [pps setValue:_picturesArray forKey:@"picturesArray"];
    self.scene = pps;
    return [super init];
}

@end
