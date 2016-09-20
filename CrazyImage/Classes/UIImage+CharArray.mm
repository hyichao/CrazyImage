//
//  UIImage+CharArray.m
//  Pods
//
//  Created by HuangCharlie on 9/20/16.
//
//

#import "UIImage+CharArray.h"

@implementation UIImage(CharArray)

-(void)toCharRGBAOneDimArray:(unsigned char*)array
{
    CGImageRef imageRef = [self CGImage];
    
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    array = (unsigned char*) calloc(height * width * 4, sizeof(unsigned char));
    
    NSUInteger bytesPerPixel = 4;
    NSUInteger bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;
    
    CGContextRef context = CGBitmapContextCreate(array, width, height, bitsPerComponent, bytesPerRow, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    
    CGColorSpaceRelease(colorSpace);
    
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
    
    CGContextRelease(context);
}

-(void)toCharRGBOneDimArray:(unsigned char*)array
{
    CGImageRef imageRef = [self CGImage];
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    
    unsigned char* rgba = (unsigned char*) calloc(height * width * 4, sizeof(unsigned char));
    [self toCharRGBAOneDimArray:rgba];
    
    array = (unsigned char*) calloc(height * width * 3, sizeof(unsigned char));
    
    /*
     convert 4 channels to 3 channel directly
     */
    for(int i=0; i<width*height; i++) {
        array[i*3+0] = rgba[i*4+0];
        array[i*3+1] = rgba[i*4+1];
        array[i*3+2] = rgba[i*4+2];
    }
}

@end
