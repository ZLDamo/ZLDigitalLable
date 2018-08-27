//
//  NSString+Width.m
//  TestDamo
//
//  Created by Damo on 2018/7/20.
//  Copyright © 2018年 Damo. All rights reserved.
//

#import "NSString+Width.h"

@implementation NSString (Width)

- (CGFloat)getDigitalWidthWithDigitalWidth:(CGFloat)digitalWidth dotWidth:(CGFloat)dotWidth {
    CGFloat width = 0;
    for (int i = 0; i < self.length; i ++) {
        NSString *str = [self substringWithRange:NSMakeRange(i, 1)];
        if ([self.symbolArray containsObject:str]) {
            width += dotWidth;
        } else {
            width += digitalWidth;
        }
    }
    return width;
}

- (NSArray <NSNumber *>*)rangeOfSymbol {
    if (self.length == 0) return nil;
    NSMutableArray *marray = [NSMutableArray arrayWithCapacity:4];
    for (int i = 0; i < self.length; i ++) {
        NSString *str = [self.copy substringWithRange:NSMakeRange(i, 1)];
        if ([self.symbolArray containsObject:str]) {
            [marray addObject:@(i)];
       }
    }
    return marray.count > 0 ? marray.copy : nil;
}

- (NSArray *)symbolArray {
    return @[@".",@",",@":",@";",@"'",@"\"",@"`",@"!"];
}

@end
