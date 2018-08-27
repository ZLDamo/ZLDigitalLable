//
//  NSString+Width.h
//  TestDamo
//
//  Created by Damo on 2018/7/20.
//  Copyright © 2018年 Damo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Width)


/**
 返回字符串的宽度

 @param digitalWidth 数字及字符串的宽度
 @param dotWidth 部分标点的宽度
 @return 总宽度
 */
- (CGFloat)getDigitalWidthWithDigitalWidth:(CGFloat)digitalWidth dotWidth:(CGFloat)dotWidth;


/**
 获取符号的下表数组

 @return 符号位置表
 */
- (NSArray <NSNumber *>*)rangeOfSymbol;
@end
