//
//  ViewController.m
//  编程测试_demo
//
//  Created by 程磊 on 17/5/9.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "ViewController.h"
#import "CreatControls.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 链式编程
    [self programing];

}

- (void)programing
{
    UIFont *font1 = [UIFont systemFontOfSize:14.0f];
    UIColor *textColor = [UIColor whiteColor];
    UIColor *backColor = [UIColor cyanColor];
    CGRect frame1 = CGRectMake(100, 100, 100, 30);

    UILabel *view = [CreatControls creatControls:^(CreatControls<CreatControlsProtocol> *controls) {
        controls.label.backColor(backColor).rect(frame1).title(@"测试").middle_alignment.titleColor(textColor).setFont(font1);
    }];
    [self.view addSubview:view];
    NSLog(@"++%@",view);
    
    CGRect frame2 = CGRectMake(100, 200, 100, 30);
    UIView *view1 = [CreatControls creatControls:^(CreatControls<CreatControlsProtocol> *controls) {
        controls.label.backColor(backColor).rect(frame2).title(@"测试2").titleColor(textColor).setFont(font1).cornerRadius(5.0f).borderWidth(1.0f).borderColor([UIColor blackColor].CGColor);
    }];
    [self.view addSubview:view1];

    
    CGRect frame3 = CGRectMake(100, 300, 100, 30);
    UITextField *tf = [CreatControls creatControls:^(CreatControls<CreatControlsProtocol> *controls) {
        controls.textfield.placeholder(@"测试3").backColor(backColor).rect(frame3).titleColor(textColor).setFont(font1);
    }];
    [self.view addSubview:tf];
    
    CGRect frame4 = CGRectMake(100, 370, 100, 30);
    UIButton *btn = [CreatControls creatControls:^(CreatControls<CreatControlsProtocol> *controls) {
        controls.button.rect(frame4).backColor(backColor).title(@"点击").borderWidth(1.0f).borderColor([UIColor redColor].CGColor);
    }];
    [self.view addSubview:btn];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
