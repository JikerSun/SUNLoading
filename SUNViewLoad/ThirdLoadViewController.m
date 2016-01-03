//
//  ThirdLoadViewController.m
//  SUNViewLoad
//
//  Created by 杭州任性贸易有限公司 on 15/12/10.
//  Copyright (c) 2015年 杭州任性贸易有限公司. All rights reserved.
//

#import "ThirdLoadViewController.h"
#import "ViewController.h"

@interface ThirdLoadViewController ()

@end

@implementation ThirdLoadViewController
{UIWebView *webView;}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self addWebView];
//    [self creadSwipeGestureTapLeft];
//    [self creadSwipeGestureTapRight];

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSUserDefaults standardUserDefaults] setObject:@"yes" forKey:@"isFirst"];
    //添加webview
    [self addWebView];
    //添加滑动手势
    [self creadSwipeGestureTapLeft];
    [self creadSwipeGestureTapRight];
    //添加点击手势
    [self creatButton];
    
}

/**
 *  添加webview
 */
-(void)addWebView
{
#warning  注意在html中图片的地址要手动设置
    webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    NSString* path = [[NSBundle mainBundle] pathForResource:@"3" ofType:@"gif"];
    //设置web图片撑满屏幕
    webView.scalesPageToFit = YES;
    //设置不能上下滑动
    webView.scrollView.alwaysBounceVertical = NO;
    
    NSURL* url = [NSURL fileURLWithPath:path];
    NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
    [webView loadRequest:request];
    [self.view addSubview:webView];
}
/**
 *  添加向左滑动手势
 */
-(void)creadSwipeGestureTapLeft
{
    UISwipeGestureRecognizer  *swipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(gestureLeft:)];
    
    //    滑动的方向的设置(是一个枚举)  (例子是向左)
    swipe.direction=UISwipeGestureRecognizerDirectionLeft;
    
    //    numberOfTouchesRequired    (滑动的手指数)
    swipe.numberOfTouchesRequired=1;
    
    [webView  addGestureRecognizer:swipe];
    
}
/**
 *  添加向右滑动手势
 */
-(void)creadSwipeGestureTapRight
{
    UISwipeGestureRecognizer  *swipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(gestureRitght:)];
    
    swipe.direction=UISwipeGestureRecognizerDirectionRight;
    
    swipe.numberOfTouchesRequired=1;
    
    [webView  addGestureRecognizer:swipe];
    
}
/**
 *  添加点击的按钮
 */
-(void)creatButton
{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, self.view.bounds.size.height/4*3, self.view.bounds.size.width, self.view.bounds.size.height/4);
    [button addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [webView addSubview:button];
    

}
-(void)onClick
{
    NSLog(@"左滑动响应喽");
    ViewController *viewVC=[[ViewController alloc]init];
    viewVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:viewVC animated:YES completion:nil];

}

-(void)gestureLeft:(UIGestureRecognizer *)tapGesture
{
    NSLog(@"左滑动响应喽");
    ViewController *viewVC=[[ViewController alloc]init];
    viewVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

    [self presentViewController:viewVC animated:YES completion:nil];
    
}

-(void)gestureRitght:(UIGestureRecognizer *)tapGesture
{
    NSLog(@"右滑动响应喽");
    [self dismissViewControllerAnimated:YES completion:nil] ;
    
}


-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    webView=nil;
    self.view=nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
