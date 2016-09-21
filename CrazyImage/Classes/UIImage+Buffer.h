//
//  UIImage+CrazyConvert.h
//  Pods
//
//  Created by HuangCharlie on 9/20/16.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreImage/CoreImage.h>
#import <AVFoundation/AVFoundation.h>

@interface UIImage(Buffer)

+(UIImage*)fromCMSampleBuffer:(CMSampleBufferRef)buffer;

+(UIImage*)fromCMSampleBuffer:(CMSampleBufferRef)buffer
                        scale:(CGFloat)scale
                  orientation:(int)orientation;

+(UIImage*)fromCVPixelBuffer:(CVPixelBufferRef)buffer;

+(UIImage*)fromCVPixelBuffer:(CVPixelBufferRef)buffer
                       scale:(CGFloat)scale
                 orientation:(int)orientation;

@end
