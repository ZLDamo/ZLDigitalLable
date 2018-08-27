//
//  UIImage+BTImage.h
//  TestDamo
//
//  Created by Damo on 2018/7/19.
//  Copyright © 2018年 Damo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+Width.h"
#define DIGITAL_FONTWIDTH_RATE 0.58
#define DOT_FONTWIDTH_RATE     0.33

@interface UIImage (DigitalImage)

+ (UIImage *)imageWithContent:(NSString *)content
                        frame:(CGRect)frame
                        color:(UIColor *)color
                     fontSize:(CGFloat)size
                 digitalWidth:(CGFloat)digitalWidth
                     dotWidth:(CGFloat)dotWidth;

+ (UIImage *)imageSetAttributeStrWithStringArray:(NSArray<NSString *> *)strArr
                                       fontArray:(NSArray<NSNumber *> *)fontArr
                                      colorArray:(NSArray <UIColor *> *)colorArr
                               digitalWidthArray:(NSArray <NSNumber *> *)digitalWidthArray
                                           frame:(CGRect)frame;

@end
