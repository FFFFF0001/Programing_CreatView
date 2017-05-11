//
//  CreatControls.h
//  编程测试_demo
//
//  Created by 程磊 on 17/5/10.
//  Copyright © 2017年 zw. All rights reserved.
//

// ---------函数式编程方法创建控件-----------

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CreatControls;


#pragma mark ---- 协议
@protocol CreatControlsProtocol;// 创建
@protocol CommonProtocol;// 共同属性
@protocol AttributeProtocol;// 非共同属性

#pragma mark ---- block
typedef CreatControls<CommonProtocol,AttributeProtocol> *(^BackColorBlock)(UIColor *);
typedef CreatControls<CommonProtocol,AttributeProtocol> *(^FrameBlock)(CGRect);
typedef CreatControls<CommonProtocol,AttributeProtocol> *(^CornerRadiusBlock)(CGFloat);
typedef CreatControls<CommonProtocol,AttributeProtocol> *(^BorderWidthBlock)(CGFloat);
typedef CreatControls<CommonProtocol,AttributeProtocol> *(^BorderColorBlock)(CGColorRef);


typedef CreatControls<CommonProtocol,AttributeProtocol> *(^TitleBlock)(NSString *text);
typedef CreatControls<CommonProtocol,AttributeProtocol> *(^TextColorBlock)(UIColor *color);
typedef CreatControls<CommonProtocol,AttributeProtocol> *(^FontBlock)(UIFont *font);
typedef CreatControls<CommonProtocol,AttributeProtocol> *(^PlaceholderBlock)(NSString *);


#pragma mark -
@protocol CreatControlsProtocol <NSObject>
// 不同控件
@property(nonatomic, strong, readonly)CreatControls<CommonProtocol,AttributeProtocol> *view;
@property(nonatomic, strong, readonly)CreatControls<CommonProtocol,AttributeProtocol> *label;
@property(nonatomic, strong, readonly)CreatControls<CommonProtocol,AttributeProtocol> *textfield;
@property(nonatomic, strong, readonly)CreatControls<CommonProtocol,AttributeProtocol> *button;

@end


@protocol CommonProtocol <NSObject>

// 共同属性
@property(nonatomic, copy, readonly)BackColorBlock backColor;
@property(nonatomic, copy, readonly)FrameBlock rect;
@property(nonatomic, copy, readonly)CornerRadiusBlock cornerRadius;// 半径
@property(nonatomic, copy, readonly)BorderWidthBlock borderWidth;// 边框宽度
@property(nonatomic, copy, readonly)BorderColorBlock borderColor;// 边框颜色

@end


@protocol AttributeProtocol <NSObject>

@property(nonatomic, copy, readonly)TitleBlock title;
@property(nonatomic, copy, readonly)TextColorBlock titleColor;
@property(nonatomic, copy, readonly)FontBlock font;

@property(nonatomic, strong, readonly)CreatControls<AttributeProtocol,CommonProtocol> *left_alignment;
@property(nonatomic, strong, readonly)CreatControls<AttributeProtocol,CommonProtocol> *middle_alignment;
@property(nonatomic, strong, readonly)CreatControls<AttributeProtocol,CommonProtocol> *right_alignment;

@property(nonatomic, copy, readonly)PlaceholderBlock placeholder;

@end


#pragma mark -
@interface CreatControls : NSObject

// 传递一个遵循CreatControlsProtocol协议的方法给实例调用者
typedef void(^CreatBlock)(CreatControls<CreatControlsProtocol> *controls);
+ (id)creatControls:(CreatBlock)block;

@end
