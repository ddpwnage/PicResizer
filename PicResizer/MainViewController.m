//
//  MainViewController.m
//  PicResizer
//
//  Created by Danny Dalton on 3/30/15.
//  Copyright (c) 2015 Dannydalton.com. All rights reserved.
//

#import "MainViewController.h"
#import "picturePreview.h"

@implementation MainViewController {
    NSMutableArray *listOfPictures;
    IBOutlet UILabel *amntPicturesSelected;
}


-(void)viewWillAppear:(BOOL)animated {
    listOfPictures = [NSMutableArray arrayWithObjects:_imageSentIn, nil];
    amntPicturesSelected.text = @"1 picture selected";
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    [listOfPictures addObject:chosenImage];
    amntPicturesSelected.text = [NSString stringWithFormat:@"%lu pictures selected", (unsigned long)listOfPictures.count+1];
    // add it to the image preview
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)checkForStillCapability {
    NSArray *frontCamera = [UIImagePickerController availableCaptureModesForCameraDevice:UIImagePickerControllerCameraDeviceFront];
    for (NSObject *frontValue in frontCamera) {
        if (frontValue == UIImagePickerControllerCameraCaptureModePhoto) {
            return TRUE;
        }
    }
    NSArray *backCamera = [UIImagePickerController availableCaptureModesForCameraDevice:UIImagePickerControllerCameraDeviceRear];
    for (NSObject *backValue in backCamera) {
        if (backValue == UIImagePickerControllerCameraCaptureModePhoto) {
            return TRUE;
        }
    }
    NSLog(@"Camera has no ability for stills.");
    return FALSE;
}

- (IBAction)cameraOrPicker:(UIButton *)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Picture source" message:@"Where do you want to choose a picture from?" preferredStyle:UIAlertControllerStyleActionSheet];
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] && [self checkForStillCapability]) {
        UIAlertAction *takePic = [UIAlertAction actionWithTitle:@"Use the camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
            picker.allowsEditing = NO;
            picker.delegate = self;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:picker animated:YES completion:nil];
        }];
        [alertController addAction:takePic];
    }
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIAlertAction *choosePic = [UIAlertAction actionWithTitle:@"Use the photo gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
            picker.allowsEditing = NO;
            picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            picker.delegate = self;
            [self presentViewController:picker animated:YES completion:nil];
        }];
        [alertController addAction:choosePic];
    }
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
