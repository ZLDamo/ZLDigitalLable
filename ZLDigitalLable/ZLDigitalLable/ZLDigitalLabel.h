//
//  BTLabel.h
//  TestDamo
//
//  Created by Damo on 2018/7/19.
//  Copyright © 2018年 Damo. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface ZLDigitalLabel : UIImageView

@property (nonatomic, strong) IBInspectable NSString        *text;
@property (nonatomic, assign) IBInspectable CGFloat         fontSize;
@property (nonatomic, strong) IBInspectable UIColor         *color;
@property (nonatomic, assign) IBInspectable CGFloat         digitalWidth;
@property (nonatomic, assign) IBInspectable CGFloat         dotWidth;
@property (nonatomic,getter=isAutoWidth ,assign) IBInspectable BOOL autoWidth;


- (void)setAttributeString:(NSArray<NSString *> *)strArr
                 fontArray:(NSArray<NSNumber *> *)fontArr
                colorArray:(NSArray<UIColor *> *)colorArr
         digitalWidthArray:(NSArray <NSNumber *> *)digitalWidthArray;
@end
