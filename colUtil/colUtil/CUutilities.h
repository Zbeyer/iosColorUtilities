//
//  CUutilities.h
//  colUtil
//
//  Created by Zack Beyer on 5/7/15.
//  Copyright (c) 2015 zbeyer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

struct Colors
{
    float red;
    float green;
    float blue;
    
} color;

@interface CUutilities : NSObject

+ (struct Colors) colorFromHexString:(NSString*)hex;

+ (UIColor *) uiColorFromColorData:(struct Colors)color;

+ (NSString *) hexStringFromColor:(UIColor *)color;

//+ (float) luminsFromUIColor:(UIColor *) color;

+ (float) luminsFromRedChannel:(float)red greenChannel:(float)green blueChannel:(float)blue;

+ (float) luminocityScoreContrasting:(float)lum1 and:(float)lum2;
+ (float) luminsFromHexString:(NSString*)hex;


@end
