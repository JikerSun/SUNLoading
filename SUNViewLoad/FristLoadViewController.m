//
//  FristLoadViewController.m
//  SUNViewLoad
//
//  Created by 杭州任性贸易有限公司 on 15/12/10.
//  Copyright (c) 2015年 杭州任性贸易有限公司. All rights reserved.
//

#import "FristLoadViewController.h"
#import "SecondLoadViewController.h"

@interface FristLoadViewController ()

@end

@implementation FristLoadViewController
{UIWebView *webView;}
- (void)viewDidLoad {
    [super viewDidLoad];
//    //添加webview
//    [self addWebView];
//   //添加滑动手势
//    [self creadSwipeGestureTapLeft];

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //添加webview
    [self addWebView];
    //添加滑动手势
    [self creadSwipeGestureTapLeft];
}

/**
 *  添加webview
 */
-(void)addWebView
{
#warning  注意在html中图片的地址要手动设置
    webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    NSString* path = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"gif"];
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
    
    //    滑动的方向的设置(是一个枚举)  (例子是向左)
    swipe.direction=UISwipeGestureRecognizerDirectionRight;
    
    //    numberOfTouchesRequired    (滑动的手指数)
    swipe.numberOfTouchesRequired=1;
    
    [webView  addGestureRecognizer:swipe];
    
}
-(void)gestureLeft:(UIGestureRecognizer *)tapGesture
{
    NSLog(@"左滑动响应喽");
    SecondLoadViewController *secVC=[[SecondLoadViewController alloc]init];
//    [secVC.view addAnimation:animation forKey:@"animation"];
    secVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:secVC animated:YES completion:nil];
    
    
}

-(void)gestureRitght:(UIGestureRecognizer *)tapGesture
{
    NSLog(@"右滑动响应喽");
    
    
}


-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    webView=nil;
    self.view=nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
