//
//  UIImage+CharArray.m
//  Pods
//
//  Created by HuangCharlie on 9/20/16.
//
//

#import "UIImage+CharArray.h"

@implementation UIImage(CharArray)

-(unsigned char*)toCharRGBAOneDimArray
{
    CFDataRef pixelData = CGDataProviderCopyData(CGImageGetDataProvider(self.CGImage));
    unsigned char *rgbaData = (unsigned char *)CFDataGetBytePtr(pixelData);
    return rgbaData;
}

-(unsigned char*)toCharRGBOneDimArray
{
    CGImageRef imageRef = [self CGImage];
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    
    unsigned char* rgba = [self toCharRGBOneDimArray];
    
    unsigned char* rgb = (unsigned char*) calloc(height * width * 3, sizeof(unsigned char));
    
    /*
     convert 4 channels to 3 channel directly
     */
    for(int i=0; i<width*height; i++) {
        rgb[i*3+0] = rgba[i*4+0];
        rgb[i*3+1] = rgba[i*4+1];
        rgb[i*3+2] = rgba[i*4+2];
    }
    
    return rgb;
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
