//
//  MainViewController.h
//  PicResizer
//
//  Created by Danny Dalton on 3/30/15.
//  Copyright (c) 2015 Dannydalton.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (atomic, retain) UIImage* imageSentIn;

@end
