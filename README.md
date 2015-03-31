# PicResizer-for-iOS
Source code of the iOS version of PicResizer.

Quick notes and file descriptions:

`The source code is located under the "PicResizer/" folder.`

`AppDelegate.h and AppDelegate.m` - The Objective-C class for app delegations. Nothing is different from the default (so far.)
`bgImg.jpg` - The image asset used as a background image.
`Icon.png` - the app icon (currently).
`Images.xcassets` - Every image the app needs to use in order for it to function, in every size it needs.
`Info.plist` - required by iOS. Gives info about the app.
`main.m` - the method file that launches the app... and the one the debugger redirects you to with a friendly "`signal SIGBART`" when something goes wrong.
`MainViewController.m and MainViewController.h` - the view controller that should show the carousel of images.
`picturePreviewScene.m and picturePreviewScene.m` - the `SCNScene` referred to for the carousel.
`picturePreview.m and picturePreview.m` - the `SCNView` containing the `SCNScene` for the carousel.
`ViewController.m and ViewController.h` - the start screen of the app
`Base.lproj` contains `Main.storyboard` (the main storyboard file) and `LaunchScreen.xib` (the XIB file for the launch screen, for iOS 8+)

Outside of `PicResizer/` , there's the Xcode-generated XCODEPROJ file for the Xcode project and the Xcode-generated
test files.
