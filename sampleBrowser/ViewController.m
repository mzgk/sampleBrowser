//
//  ViewController.m
//  sampleBrowser
//
//  Created by Mizugaki on 2015/02/13.
//  Copyright (c) 2015年 mzgk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
    [super loadView];

    // 通知の受信
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(applicationDidEnterBackground)
                                                name:@"applicationDidEnterBackground"
                                              object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(applicationDidBecomeActive)
                                                name:@"applicationDidBecomeActive"
                                              object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)applicationDidEnterBackground {
    NSLog(@"%s", __FUNCTION__);
}

- (void)applicationDidBecomeActive {
    NSLog(@"%s", __FUNCTION__);
}
@end
