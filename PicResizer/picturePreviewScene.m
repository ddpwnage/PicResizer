//
//  picturePreviewScene.m
//  PicResizer
//
//  Created by Danny Dalton on 3/30/15.
//  Copyright (c) 2015 Dannydalton.com. All rights reserved.
//

#import "picturePreviewScene.h"

@implementation picturePreviewScene {
    int amountOfPics;
}

-(void)awakeFromNib {
    NSLog(@"awakeFromNib method called.");
    SCNCamera *camera = [SCNCamera camera];
    camera.xFov = 45;
    camera.yFov = 45;
    SCNNode *cameraNode = [SCNNode node];
    cameraNode.camera = camera;
    cameraNode.position = SCNVector3Make(0, 0, 30);
    [self.rootNode addChildNode:cameraNode];
    
    SCNLight *lighting = [SCNLight light];
    lighting.attenuationEndDistance = 50;
    lighting.castsShadow = YES;
    lighting.attenuationStartDistance = 30;
    lighting.color = [UIColor whiteColor];
    
    int currentpic = 0;
    SCNVector3 picPosition;
    float x;
    float y;
    float z;
    amountOfPics = (int)_picturesArray.count;
    amountOfPics++;
    for (UIImage *picture in _picturesArray) {
        // get height and width based off image dimensions, but this will work! :D
        SCNBox *picBox = [SCNBox boxWithWidth:10 height:10 length:10 chamferRadius:1];
        
        SCNMaterial *pict = [SCNMaterial material];
        pict.diffuse.contents = picture;
        pict.specular.contents = [UIColor whiteColor];
        pict.shininess = 0.05;
        
        picBox.materials = @[pict];
        
        SCNNode *picBoxNode = [SCNNode nodeWithGeometry:picBox];
        
        currentpic++;
        x = sinf(currentpic * ((2 * M_PI) / amountOfPics));
        y = 0;
        z = cosf(currentpic * ((2 * M_PI) / amountOfPics));
        picPosition = SCNVector3Make(x, y, z);
        
        picBoxNode.position = picPosition;
        
        picBoxNode.name = [NSString stringWithFormat:@"pic%d", currentpic];
        
        picBoxNode.light = lighting;
        
        [self.rootNode addChildNode:picBoxNode];
    }
}

-(void)removePictures {
    // remove each of the previously added pictures.
    for (int i = 1; i < amountOfPics; i++) {
        
    }
}

-(void)addPicture:(UIImage*)picture {
    [_picturesArray addObject:picture];
    [self removePictures];
    [self awakeFromNib];
}

-(id)init {
    [self awakeFromNib];
    return [super init];
}

@end
