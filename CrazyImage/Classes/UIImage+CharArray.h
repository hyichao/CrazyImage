//
//  UIImage+CharArray.h
//  Pods
//
//  Created by HuangCharlie on 9/20/16.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage(CharArray)

/*
 once we want to use OpenCV or some other c++ libraries,
 such as attempting to build face detection algorithm on iOS,
 we need to convert UIImage into an one dimension array of char, and then move forward to other data structure, i.e. cv::Mat. However, cv::Mat is usually 3 channels without Alpha, therefore when need to acheive rgb char array, we use "toCharRGBOneDimArray"; otherwise we use "toCharRGBAOneDimArray".
 */

// convert UIImage into char array, RGBA 4 channels
// Note:
// claim a variable before using.
// "unsigned char* rgba = malloc(width*height*4);"
// Don't forget to free rgba
-(void)toCharRGBAPixelArray:(unsigned char*)rgba;

// convert UIImage into char array, RGB 3 channels only
// Note:
// claim a variable before using.
// "unsigned char* rgb = malloc(width*height*3);"
// Don't forget to free rgb
-(void)toCharRGBPixelArray:(unsigned char*)rgb;


@end
