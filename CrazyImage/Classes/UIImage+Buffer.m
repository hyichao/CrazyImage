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
                                 scale:1.0
                           orientation:0];
}

+(UIImage*)fromCMSampleBuffer:(CMSampleBufferRef)buffer
                        scale:(CGFloat)scale
                  orientation:(int)orientation
{
    CVPixelBufferRef pixelBuffer = CMSampleBufferGetImageBuffer(buffer);
    return [UIImage fromCVPixelBuffer:pixelBuffer
                                scale:scale
                          orientation:orientation];
}

#pragma mark - From CVPixelBuffer
+(UIImage*)fromCVPixelBuffer:(CVPixelBufferRef)buffer
{
    return [UIImage fromCVPixelBuffer:buffer
                                scale:1.0
                          orientation:0];
}

+(UIImage*)fromCVPixelBuffer:(CVPixelBufferRef)buffer
                       scale:(CGFloat)scale
                 orientation:(int)orientation
{
    CIImage *ciImage = [CIImage imageWithCVPixelBuffer:buffer];
    
    ciImage = [ciImage imageByApplyingOrientation:orientation];
    ciImage = [ciImage imageByApplyingTransform:CGAffineTransformMakeScale(scale, scale)];
    CIContext *temporaryContext = [CIContext contextWithOptions:nil];
    
    CGRect rect = CGRectMake(0, 0,ciImage.extent.size.width,ciImage.extent.size.height);
    CGImageRef videoImage = [temporaryContext createCGImage:ciImage fromRect:rect];
    
    UIImage *uiImage = [UIImage imageWithCGImage:videoImage];
    CGImageRelease(videoImage);
    return uiImage;
}

@end
