//
//  WidthEqualVC.m
//  TestDamo
//
//  Created by Damo on 2018/7/19.
//  Copyright © 2018年 Damo. All rights reserved.
//

#import "WidthEqualVC.h"
#import "ZLDigitalLabel.h"

@interface WidthEqualVC ()
@property (weak, nonatomic) IBOutlet UILabel *valueLb;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *rangeValueLb;
@property (weak, nonatomic) IBOutlet ZLDigitalLabel *contentLb;
@property (weak, nonatomic) IBOutlet ZLDigitalLabel *rangeLb;

@end

@implementation WidthEqualVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentLb.autoWidth    = YES;
    self.rangeLb.autoWidth      = YES;
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)actionSlider:(UISlider *)sender {
    float weight = sender.value / 10.0;
//    self.valueLb.text = [NSString stringWithFormat:@"%.1f",weight];
//    [self setAttributeWithStr:[NSString stringWithFormat:@"%.1f",weight]];
    [self.contentLb setText:[NSString stringWithFormat:@"%.1f",weight]];
    //自己定义的宽度
    [self.rangeLb setAttributeString:@[@"体重还差:",[NSString stringWithFormat:@"%.1f",weight],@"公斤"] fontArray:@[@15,@25,@15] colorArray:nil digitalWidthArray:@[@(15),@(20),@(15)]];
}

- (void)setAttributeWithStr:(NSString *)str {
    NSMutableAttributedString *attributedString =  [[NSMutableAttributedString alloc] initWithString:str attributes:@{NSKernAttributeName : @(1.5f)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:6];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, str.length)];
    [self.valueLb setAttributedText:attributedString];
}


- (IBAction)acitonAutoWidth:(id)sender {
    self.contentLb.autoWidth = !self.contentLb.autoWidth;
    
}


@end
