//
//  CUutilities.m
//  colUtil
//
//  Created by Zack Beyer on 5/7/15.
//  Copyright (c) 2015 zbeyer. All rights reserved.
//

#import "CUutilities.h"

@implementation CUutilities

+ (struct Colors) colorFromHexString:(NSString*)hex;
{
    //Initialize default return
    struct Colors color;
    color.red  = 0;
    color.green= 0;
    color.blue = 0;
    
    // Format Color String
    NSString *colorString = [[hex stringByTrimmingCharactersInSet:
                              [NSCharacterSet whitespaceAndNewlineCharacterSet]]
                             uppercaseString];
    
    // String should be 6 or 8 characters (RGB and optional 0X)
    // 0XFFCC99 or FFCC99
    if ([colorString length] < 6)
        return color;
    
    // strip 0X if it appears
    // FFCC99
    if ([colorString hasPrefix:@"0X"])
        colorString = [colorString substringFromIndex:2];
    
    // strip # if it appears
    if ([colorString hasPrefix:@"#"])
        colorString = [colorString substringFromIndex:1];
    
    //String MUST be 6 characters In Length
    if ([colorString length] != 6)
        return  color;
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;     //Start at index 0 of string
    range.length = 2;       //FF | CC | 99
    //RR | GG | BB
    
    NSString * redString = [colorString substringWithRange:range];
    
    range.location = 2;
    NSString * greenString = [colorString substringWithRange:range];
    
    range.location = 4;
    NSString * blueString = [colorString substringWithRange:range];
    
    unsigned int red, green, blue;
    [[NSScanner scannerWithString:redString]    scanHexInt:&red];
    [[NSScanner scannerWithString:greenString]  scanHexInt:&green];
    [[NSScanner scannerWithString:blueString]   scanHexInt:&blue];
    
    color.red   = (float)  red   / 255.0f;
    color.green = (float)  green / 255.0f;
    color.blue  = (float)  blue  / 255.0f;
    
    return color;
}

+ (UIColor *) uiColorFromColorData:(struct Colors)color;
{
    return [UIColor colorWithRed:color.red
                           green:color.green
                            blue:color.blue
                           alpha:1.0f];
}

+ (NSString *) hexStringFromColor:(UIColor *)color;
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    return [NSString stringWithFormat:@"%02lX%02lX%02lX",
            lroundf(r * 255),
            lroundf(g * 255),
            lroundf(b * 255)];
}

+ (float) luminsFromHexString:(NSString*)hex;
{
    struct Colors color = [CUutilities colorFromHexString:hex];
    
    return [CUutilities luminsFromRedChannel:color.red
                                 greenChannel:color.green
                                  blueChannel:color.blue];
}

//+ (float) luminsFromUIColor:(UIColor *) color;
//{
//    
//    const CGFloat *components = CGColorGetComponents(color.CGColor);
//    CGFloat r = components[0];
//    CGFloat g = components[1];
//    CGFloat b = components[2];
//    
//    return [CUutilities luminsFromRedChannel:r greenChannel:g blueChannel:b];
//}

+ (float) luminsFromRedChannel:(float)red greenChannel:(float)green blueChannel:(float)blue;
/** 
 * Using the fomula for Web Content Accessibility Guidelines (WCAG) 2.0:
 * http://www.w3.org/TR/WCAG/#relativeluminancedef
 * 
 * Assumes each color RGB channel is 8 bits
 */
{
    float R = (red <= 0.03928)    ? red/12.92     : powf(((red + 0.055)/1.055), 2.4);
    float G = (green <= 0.03928)  ? green/12.92   : powf(((green + 0.055)/1.055), 2.4);
    float B = (blue <= 0.03928)   ? blue/12.92    : powf(((blue + 0.055)/1.055), 2.4);
    return (0.2126 * R + 0.7152 * G + 0.0722 * B);
}

+ (float) luminocityScoreContrasting:(float)lum1 and:(float)lum2;
/**
 * return the luminocity / contrast rating compairing two luminance percents
 * Using the fomula for Web Content Accessibility Guidelines (WCAG) 2.0:
 * http://www.w3.org/TR/WCAG/#relativeluminancedef
 */
{
    float score = 0;
    float lesser, greater;
    
    if (lum1 > lum2)
    {
        lesser  = lum2;
        greater = lum1;
    }
    else
    {
        lesser = lum1;
        greater = lum2;
    }
    
    score = (float) (lround((greater + 0.05) / (lesser + 0.05) * 10)) / 10;
    
    return score;
}

@end
