//
//  BTLabel.m
//  TestDamo
//
//  Created by Damo on 2018/7/19.
//  Copyright © 2018年 Damo. All rights reserved.
//

#import "ZLDigitalLabel.h"
#import "UIImage+DigitalImage.h"


@implementation ZLDigitalLabel {
    CGFloat _digitalW;
    CGFloat dotW;
    BOOL    _isAttribute;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    if (!_color) {
        _color          = [UIColor whiteColor];
    }
    if (_fontSize == 0) {
        _fontSize       = 17;
        _digitalWidth   = 10.f;
        _dotWidth       = 5.f;
    }
}

- (instancetype)init {
    if (self = [super init]) {
        if (!_color) {
            _color          = [UIColor whiteColor];
        }
        if (_fontSize == 0) {
            _fontSize       = 17;
            _digitalWidth   = 10.f;
            _dotWidth       = 5.f;
        }
    }
    return self;
}

- (void)setText:(NSString *)text {
    _text         = text;
    _isAttribute = NO;
    CGFloat width = 0;
    if (text.length > 0) {
        CGPoint center = self.center;
        NSArray *array = [text rangeOfSymbol];
        width = self.digitalWidth * (text.length - array.count) + self.dotWidth * array.count;
  
        CGRect frame    = CGRectMake(0,0, width, self.frame.size.height);
        if (self.autoWidth) {
            self.frame  = frame;
            self.center = center;
        }
//        else {
//            if (self.frame.size.width <= width) {
//                frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//            } else {
//                CGFloat x = (self.frame.size.width - width) / 2;
//                frame = CGRectMake(x, 0, self.frame.size.width, self.frame.size.height);
//            }
//            CGFloat x = (self.frame.size.width - width) / 2;
//            frame = CGRectMake(x, 0, self.frame.size.width, self.frame.size.height);
//        }
        UIImage *image = [UIImage imageWithContent:text frame:frame color:self.color fontSize:self.fontSize digitalWidth:self.digitalWidth dotWidth:self.dotWidth];
        self.image = image;
    } else {
        self.image = nil;
    }
}

- (void)setFontSize:(CGFloat)fontSize {
    _fontSize           = fontSize;
    if (self.isAutoWidth) {
        _digitalWidth   = fontSize * DIGITAL_FONTWIDTH_RATE;
        _dotWidth       = fontSize * DOT_FONTWIDTH_RATE;
    }
    if (!_isAttribute) {
        [self setText:_text];
    }
}

- (void)setColor:(UIColor *)color {
    _color = color;
    if (!_isAttribute) {
        [self setText:_text];
    }
}

- (void)setDotWidth:(CGFloat)dotWidth {
    if (!self.isAutoWidth) {
        _dotWidth = dotWidth;
        if (!_isAttribute) {
            [self setText:_text];
        }
    }
}

- (void)setDigitalWidth:(CGFloat)digitalWidth {
    if (!self.isAutoWidth) {
        _digitalWidth = digitalWidth;
        if (!_isAttribute) {
            [self setText:_text];
        }
    }
}

- (void)setAttributeString:(NSArray<NSString *> *)strArr
                 fontArray:(NSArray<NSNumber *> *)fontArr
                colorArray:(NSArray<UIColor *> *)colorArr
         digitalWidthArray:(NSArray <NSNumber *> *)digitalWidthArray {
    _isAttribute = YES;
    if (strArr.count == 0) return;
    CGFloat width = 0;
    for (int i = 0 ; i < strArr.count ; i++) {
        CGFloat fontSize = (fontArr && i < fontArr.count) ? fontArr[i].floatValue : 17;
        CGFloat digitalWidth = (digitalWidthArray && i < digitalWidthArray.count) ? digitalWidthArray[i].floatValue : fontSize * DIGITAL_FONTWIDTH_RATE;
        width += [strArr[i] getDigitalWidthWithDigitalWidth:digitalWidth dotWidth:fontSize * DOT_FONTWIDTH_RATE];
    }
    
    CGPoint center = self.center;
    CGRect frame    = CGRectMake(0,0, width, self.frame.size.height);
    if (self.autoWidth) {
        self.frame  = frame;
        self.center = center;
    }
    
    UIImage *img = [UIImage imageSetAttributeStrWithStringArray:strArr fontArray:fontArr colorArray:colorArr digitalWidthArray:digitalWidthArray frame:frame];
    self.image = img;
}



@end
