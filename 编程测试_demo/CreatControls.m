//
//  CreatControls.m
//  编程测试_demo
//
//  Created by 程磊 on 17/5/10.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "CreatControls.h"

typedef NS_ENUM(NSUInteger, AlignmentStyle) {
    NSTextAlignmentLeftStyle = 0,
    NSTextAlignmentCenterStyle,
    NSTextAlignmentRightStyle,
};

@interface CreatControls ()<CreatControlsProtocol, CommonProtocol, AttributeProtocol >
@property(nonatomic, strong)UIView *clView;

@end
@implementation CreatControls

+ (id)creatControls:(CreatBlock)block
{
    if (block) {
        CreatControls<CreatControlsProtocol> *controls = [CreatControls<CreatControlsProtocol> new];
        block(controls);
        
        return controls.clView;
    }
    return nil;
}

- (CreatControls<CommonProtocol,AttributeProtocol> *)view
{
    // 创建UIView
    self.clView = [UIView new];
    self.clView.layer.masksToBounds = YES;

    return self;
}
- (CreatControls<CommonProtocol,AttributeProtocol> *)label
{
    // 创建UILable
    self.clView = [UILabel new];
    self.clView.layer.masksToBounds = YES;// 解决汉字渲染问题

    return self;
}
- (CreatControls<CommonProtocol,AttributeProtocol> *)textfield
{
    // 创建UITextfield
    UITextField *tf = [UITextField new];
    tf.layer.masksToBounds = YES;
    self.clView = tf;
    
    return self;
}
- (CreatControls<CommonProtocol,AttributeProtocol> *)button
{
    // 创建UIButton
    UIButton *btn = [UIButton new];
    btn.titleLabel.layer.masksToBounds = YES;
    self.clView = btn;
    
    return self;
}

- (BackColorBlock)backColor
{
    return ^(UIColor *color){
        [self.clView setBackgroundColor:color];
        if ([self.clView isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.clView;
            [btn.titleLabel setBackgroundColor:color];// button的titlelabel背景色与button一致，解决图形渲染问题
        }
        
        return self;
    };
}
- (FrameBlock)rect
{
    return ^(CGRect frame){
        [self.clView setFrame:frame];
        
        return self;
    };
}
- (CornerRadiusBlock)cornerRadius
{
    return ^id(CGFloat radius){
        self.clView.layer.cornerRadius = radius;
        
        return self;
    };
}
- (BorderColorBlock)borderColor
{
    return ^id(CGColorRef colorRef){
        self.clView.layer.borderColor = colorRef;
        
        return self;
    };
}
- (BorderWidthBlock)borderWidth
{
    return ^id(CGFloat width){
        self.clView.layer.borderWidth = width;
        
        return self;
    };
}


- (TitleBlock)title
{
    return ^(NSString *title){
        if ([self.clView isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)self.clView;
            [label setText:title];
        }else if ([self.clView isKindOfClass:[UITextField class]]) {
            UITextField *tf = (UITextField *)self.clView;
            [tf setText:title];
        }else if ([self.clView isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.clView;
            [btn setTitle:title forState:(UIControlStateNormal)];
        }

            return self;
    };
}
-(TextColorBlock)titleColor
{
    return ^(UIColor *titleColor){
        if ([self.clView isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)self.clView;
            [label setTextColor:titleColor];
        }else if ([self.clView isKindOfClass:[UITextField class]]) {
            UITextField *tf = (UITextField *)self.clView;
            [tf setTextColor:titleColor];
        }else if ([self.clView isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.clView;
            [btn setTitleColor:titleColor forState:(UIControlStateNormal)];
        }

        return self;
    };
}
- (PlaceholderBlock)placeholder
{
    return ^(NSString *str){
        if ([self.clView isKindOfClass:[UITextField class]]) {
            UITextField *tf = (UITextField *)self.clView;
            [tf setPlaceholder:str];
        }
        
        return self;
    };
}
- (FontBlock)font
{
    return ^(UIFont *font){
        if ([self.clView isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)self.clView;
            [label setFont:font];
        }else if ([self.clView isKindOfClass:[UITextField class]]) {
            UITextField *tf = (UITextField *)self.clView;
            [tf setFont:font];
        }else if ([self.clView isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)self.clView;
            [btn.titleLabel setFont:font];
        }

        return self;
    };
}

- (CreatControls<AttributeProtocol,CommonProtocol> *)left_alignment
{
    [self setAlignment:NSTextAlignmentLeft];
    
    return self;
}
- (CreatControls<AttributeProtocol,CommonProtocol> *)middle_alignment
{
    [self setAlignment:NSTextAlignmentCenter];
    
    return self;
}
- (CreatControls<AttributeProtocol,CommonProtocol> *)right_alignment
{
    [self setAlignment:NSTextAlignmentRight];
    
    return self;
}


// 传入字体alignment
- (void)setAlignment:(NSTextAlignment)alignment
{
    if ([self.clView isKindOfClass:[UILabel class]]) {
        UILabel *label = (UILabel *)self.clView;
        [label setTextAlignment:alignment];
    }else if ([self.clView isKindOfClass:[UITextField class]]) {
        UITextField *tf = (UITextField *)self.clView;
        [tf setTextAlignment:alignment];
    }else if ([self.view isKindOfClass:[UIButton class]]) {
        UIButton *btn = (UIButton *)self.clView;
        [btn.titleLabel setTextAlignment:alignment];
    }else if ([self.clView isKindOfClass:[UIButton class]]) {
        UIButton *btn = (UIButton *)self.clView;
        [btn.titleLabel setTextAlignment:alignment];
    }


}


@end
