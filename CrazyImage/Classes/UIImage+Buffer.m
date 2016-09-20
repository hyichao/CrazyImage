//
//  UIImage+CrazyConvert.m
//  Pods
//
//  Created by HuangCharlie on 9/20/16.
//
//

#import "UIImage+Buffer.h"

@implementation UIImage(Buffer)

#pragma mark - From CMSampleBuffer
+(UIImage*)fromCMSampleBuffer:(CMSampleBufferRef)buffer
{
    return [UIImage fromCMSampleBuffer:buffer
                                 scale:1.0];
}

+(UIImage*)fromCMSampleBuffer:(CMSampleBufferRef)buffer
                        scale:(CGFloat)scale
{
    CVPixelBufferRef pixelBuffer = CMSampleBufferGetImageBuffer(buffer);
    return [UIImage fromCVPixelBuffer:pixelBuffer
                                scale:scale];
}

#pragma mark - From CVPixelBuffer
+(UIImage*)fromCVPixelBuffer:(CVPixelBufferRef)buffer
{
    return [UIImage fromCVPixelBuffer:buffer
                                scale:1.0];
}

+(UIImage*)fromCVPixelBuffer:(CVPixelBufferRef)buffer
                       scale:(CGFloat)scale
{
    CIImage *ciImage = [CIImage imageWithCVPixelBuffer:buffer];
    //TODO. make it adapative
    ciImage = [ciImage imageByApplyingOrientation:5];
    ciImage = [ciImage imageByApplyingTransform:CGAffineTransformMakeScale(scale, scale)];
    CIContext *temporaryContext = [CIContext contextWithOptions:nil];
    
    CGRect rect = CGRectMake(0, 0,ciImage.extent.size.width,ciImage.extent.size.height);
    CGImageRef videoImage = [temporaryContext createCGImage:ciImage fromRect:rect];
    
    UIImage *uiImage = [UIImage imageWithCGImage:videoImage];
    CGImageRelease(videoImage);
    return uiImage;
}

@end
