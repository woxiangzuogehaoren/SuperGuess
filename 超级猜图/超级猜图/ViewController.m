//
//  ViewController.m
//  超级猜图
//
//  Created by 吴其涛 on 15/8/8.
//  Copyright (c) 2015年 超级猜图. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *movieButtonIamge;
@property (strong, nonatomic)UIButton* cover;
@end

@implementation ViewController
//控件懒加载避免重复创建控件
-(UIButton*)cover{
    if (!_cover) {
        _cover = [[UIButton alloc]initWithFrame:self.view.bounds];
        _cover.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        [self.view addSubview:_cover];
        _cover.alpha = 0.0;
        [_cover addTarget:self action:@selector(smallImage) forControlEvents:UIControlEventTouchUpInside ];
    }
    return _cover;
}
/*改变状态栏风格
    UIStatusBarStyleDefault 黑色
    UIStatusBarStyleLightContent 亮色
 */
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (IBAction)bigImage {
    //给storyboard添加蒙版(遮罩)
//    UIButton *cover = [[UIButton alloc]initWithFrame:self.view.bounds];
//    cover.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
//    [self.view addSubview:cover];
//    [cover addTarget:self action:@selector(smallImage) forControlEvents:UIControlEventTouchUpInside ];
    [self cover];
    //将movieButtonIamge前置
    //bringSubviewToFront将子试图前置方法
    [self.view bringSubviewToFront:_movieButtonIamge];
    //放大movieButtonIamge,给他动画效果
    CGFloat width = self.view.bounds.size.width;
    CGFloat heigth = width;
    CGFloat Y = (self.view.bounds.size.height-heigth)*0.5;
    //动画代码块,先要去掉自动布局,否则没有响应
    [UIView animateWithDuration:1 animations:^{
        _movieButtonIamge.frame = CGRectMake(0, Y, width, heigth);
        _cover.alpha = 1.0;
    }];
    
}
-(void)smallImage{
    //将movieButtonIamge恢复到原来的位置
    [UIView animateWithDuration:1 animations:^{
        _movieButtonIamge.frame = CGRectMake(85, 100, 200, 200);
        self.cover.alpha = 0.0;
    }];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
