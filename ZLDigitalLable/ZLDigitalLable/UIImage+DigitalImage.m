//
//  UIImage+BTImage.m
//  TestDamo
//
//  Created by Damo on 2018/7/19.
//  Copyright © 2018年 Damo. All rights reserved.
//

#import "UIImage+DigitalImage.h"

@implementation UIImage (DigitalImage)

+ (UIImage *)imageWithContent:(NSString *)content
                        frame:(CGRect)frame
                        color:(UIColor *)color
                     fontSize:(CGFloat)size
                 digitalWidth:(CGFloat)digitalWidth
                     dotWidth:(CGFloat)dotWidth {
    @autoreleasepool {
        // 开启图形'上下文'
        UIGraphicsBeginImageContextWithOptions(frame.size, NO, 0);
        // 在原生图上绘制文字
//        NSString *str = content;
        // 创建文字属性字典
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        UIColor *tempColor = color;
        if (!tempColor) {
            tempColor = UIColor.whiteColor;
        }
        
        paragraphStyle.alignment = NSTextAlignmentCenter;
        NSDictionary *dictionary = @{NSForegroundColorAttributeName: tempColor,
                                     NSFontAttributeName: [UIFont systemFontOfSize:size],
                                     NSParagraphStyleAttributeName:paragraphStyle
                                     };
        // 绘制文字属性
        CGFloat x = 0;
        CGFloat width = 0;
        CGRect tempFrame = CGRectMake(0, 0, 0, 0);
//        NSRange range = [content rangeOfString:@"."];
        NSArray <NSNumber *> *rangeArr = [content rangeOfSymbol];
        CGFloat totalWidth = digitalWidth * (content.length - rangeArr.count) + dotWidth * rangeArr.count;
        CGFloat marginX    = (frame.size.width - totalWidth) / 2;
        CGFloat marginY    = (frame.size.height - size * 1.2) / 2;
        
        for (int i = 0; i < content.length; i ++) {
                NSString *str = [content substringWithRange:NSMakeRange(i, 1)];
                x+= width;
                if (rangeArr && [rangeArr containsObject:@(i)]) {
                    width = dotWidth;
                } else {
                    width = digitalWidth;
                }
//            if (i < range.location + 1) {
//                x = i * digitalWidth;
//            } else {
//                x = (i - 1 ) * digitalWidth + dotWidth;
//            }
//            width = i == range.location ? dotWidth : digitalWidth;
//            tempFrame = CGRectMake(x + (marginX > 0 ? marginX : 0),marginY, width, size * 1.2);
            tempFrame = CGRectMake(x + marginX ,marginY, width, size * 1.2);
            str = [content substringWithRange:NSMakeRange(i, 1)];
            [str drawInRect:tempFrame withAttributes:dictionary];
        }
        
        // 从当前上下文获取修改后的图片
        UIImage *imageNew = UIGraphicsGetImageFromCurrentImageContext();
        // 结束图形上下文
        UIGraphicsEndImageContext();
        return imageNew;
    }
}

+ (UIImage *)imageSetAttributeStrWithStringArray:(NSArray<NSString *> *)strArr
                                       fontArray:(NSArray<NSNumber *> *)fontArr
                                      colorArray:(NSArray <UIColor *> *)colorArr
                               digitalWidthArray:(NSArray <NSNumber *> *)digitalWidthArray
                                           frame:(CGRect)frame {
    @autoreleasepool {
        if (strArr.count == 0) return nil;
        // 开启图形'上下文'
        
        UIGraphicsBeginImageContextWithOptions(frame.size, NO, 0);
        CGFloat x = 0;
        CGFloat width = 0;
        CGFloat totalWidth = 0;
        for (int i = 0 ; i < strArr.count ; i++) {
            CGFloat fontSize = (fontArr && i < fontArr.count) ? fontArr[i].floatValue : 17;
            CGFloat digitalWidth = (digitalWidthArray && i < digitalWidthArray.count) ? digitalWidthArray[i].floatValue : fontSize * DIGITAL_FONTWIDTH_RATE;
            totalWidth += [strArr[i] getDigitalWidthWithDigitalWidth:digitalWidth dotWidth:fontSize * DOT_FONTWIDTH_RATE];
        }
        
        for (int i = 0; i < strArr.count; i ++) {
            UIColor *tempColor      = (colorArr && i < colorArr.count )? colorArr[i] :UIColor.whiteColor ;
            CGFloat size            = (fontArr && i < fontArr.count) ? [fontArr[i] floatValue] : 17;
            CGFloat digitalWidth    = (digitalWidthArray && i < digitalWidthArray.count) ? digitalWidthArray[i].floatValue : size * DIGITAL_FONTWIDTH_RATE;
            
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.alignment = NSTextAlignmentCenter;
            if (!tempColor) tempColor = [UIColor whiteColor];
            NSDictionary *dictionary = @{NSForegroundColorAttributeName: tempColor,
                                         NSFontAttributeName: [UIFont systemFontOfSize:size],
                                         NSParagraphStyleAttributeName:paragraphStyle
                                         };

            NSArray <NSNumber *> *rangeArr = [strArr[i] rangeOfSymbol];
            CGFloat marginX    = (frame.size.width - totalWidth) / 2;
            CGFloat marginY    = (frame.size.height - size * 1.2) / 2;
            
            for (int j = 0; j < strArr[i].length;j ++) {
                NSString *str = [strArr[i] substringWithRange:NSMakeRange(j, 1)];
                x+= width;
                if (rangeArr && [rangeArr containsObject:@(j)]) {
                    width = size *DOT_FONTWIDTH_RATE;
                } else {
                    width = digitalWidth;
                }
//                CGRect tempFrame = CGRectMake(x + (marginX > 0 ? marginX : 0), marginY, width, size * 1.2);
                CGRect  tempFrame = CGRectMake(x + marginX ,marginY, width, size * 1.2);
                [str drawInRect:tempFrame withAttributes:dictionary];
//                NSLog(@"str = %@,frame = %@\n",str,NSStringFromCGRect(tempFrame));
            }
            
        }
        
        // 从当前上下文获取修改后的图片
        UIImage *imageNew = UIGraphicsGetImageFromCurrentImageContext();
        // 结束图形上下文
        UIGraphicsEndImageContext();
        return imageNew;
    }
}

@end
