# Programing_CreatView

函数式编程、链式编程、面向接口编程结合使用，自定义创建控件方法，工程不使用xib、storyboard，创建控件是一个很低效率且没啥技术含量的事情，此方法可以有效降低工作时间，为控件添加一些复杂属性也极为方便，也处理了控件渲染的问题，同时工程布局更加清晰

### 使用
- 下载demo，将`CreatControls`文件夹放入到自己工程中
- 导入CreatControls.h文件，使用[CreatControls creatControls:<#^(CreatControls<CreatControlsProtocol> *controls)block#>]方法，在block内部，controls后面只能用View类型，后面根据自己的需求添加属性，
- 非block属性不放在末尾，否则爆黄；中文部分的属性最好放最后，出现中文后面属性不能智能拼写，栗子：
```
    UIFont *font1 = [UIFont systemFontOfSize:14.0f];
    UIColor *textColor = [UIColor whiteColor];
    UIColor *backColor = [UIColor cyanColor];
    CGRect frame1 = CGRectMake(100, 100, 100, 30);

    UIView *view = [CreatControls creatControls:^(CreatControls<CreatControlsProtocol> *controls) {
        controls.label.backColor(backColor).rect(frame1).middle_alignment.titleColor(textColor).setFont(font1).title(@"测试");
    }];
    [self.view addSubview:view];
```

推荐一篇好文 [@jieme](http://www.jianshu.com/u/469322a6bd44)
这篇demo基本可以与文章对照一起看，有任何意见建议的同学请`Issues`我，如果觉得不错请点赞哟
