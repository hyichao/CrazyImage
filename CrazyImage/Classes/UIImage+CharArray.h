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
-(unsigned char*)toCharRGBAOneDimArray;


// TODO not working.
// convert UIImage into char array, RGB 3 channels only
-(unsigned char*)toCharRGBOneDimArray;

+ (void)convertRGBA:(unsigned char*)rgba
            intoRGB:(unsigned char*)rgb
              width:(int)width
             height:(int)height;


@end
