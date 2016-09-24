//
//  UIImage+CharArray.m
//  Pods
//
//  Created by HuangCharlie on 9/20/16.
//
//

#import "UIImage+CharArray.h"

@implementation UIImage(CharArray)

//unsigned char *imageBytes = malloc(width * height * bytesPerPixel);
-(void)toCharRGBAOneDimArray:(unsigned char*)rgba
{
    CGImageRef imageRef = self.CGImage;
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    NSUInteger bytesPerPixel = 4;
    NSUInteger bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef context = CGBitmapContextCreate(rgba,
                                                 width,
                                                 height,
                                                 bitsPerComponent,
                                                 bytesPerRow,
                                                 colorspace,
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
    
    CGRect rect = CGRectMake(0 , 0 , width , height);
    CGContextDrawImage(context , rect ,imageRef);
    CGColorSpaceRelease(colorspace);
    CGContextRelease(context);
}

-(void)toCharRGBOneDimArray:(unsigned char*)rgb
{
    CGImageRef imageRef = [self CGImage];
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    
    unsigned char* rgba;
    [self toCharRGBAOneDimArray:rgba];
    
    /*
     convert 4 channels to 3 channel directly
     */
    for(int i=0; i<width*height; i++) {
        rgb[i*3+0] = rgba[i*4+0];
        rgb[i*3+1] = rgba[i*4+1];
        rgb[i*3+2] = rgba[i*4+2];
    }
}

+ (void)convertRGBA:(unsigned char*)rgba
            intoRGB:(unsigned char*)rgb
              width:(int)width
             height:(int)height
{
    for(int i=0; i<width*height; i++) {
        rgb[i*3+0] = rgba[i*4+0];
        rgb[i*3+1] = rgba[i*4+1];
        rgb[i*3+2] = rgba[i*4+2];
    }
}


@end
