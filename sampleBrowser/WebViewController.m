//
//  WebViewController.m
//  sampleBrowser
//
//  Created by Mizugaki on 2015/02/18.
//  Copyright (c) 2015年 mzgk. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (strong, nonatomic) WKWebView *webView;

@end

@implementation WebViewController

- (void)loadView {
    [super loadView];

    // WKWebViewのインスタンスを生成
    self.webView = [WKWebView new];
    // WKWebViewのインスタンスを画面に配置（AutoLayoutより前に記述すること）
    [self.view insertSubview:self.webView atIndex:0];
    // フリップでの戻る／進むを有効化
    self.webView.allowsBackForwardNavigationGestures = YES;

    // AutoLayoutを使用する
    self.webView.translatesAutoresizingMaskIntoConstraints = NO;
    // 画面全体にWKWebViewを表示（配置する後に指定しないとThe view hierarchy is not prepared for the constraint:のワーニング）
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:self.webView
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeWidth
                                                            multiplier:1.0
                                                              constant:0],
                                [NSLayoutConstraint constraintWithItem:self.webView
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeHeight
                                                            multiplier:1.0
                                                              constant:0]
                                ]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // sample用にGoogleを表示
    NSURL *url = [NSURL URLWithString:@"https://google.co.jp"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
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
