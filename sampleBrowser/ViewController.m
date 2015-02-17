//
//  ViewController.m
//  sampleBrowser
//
//  Created by Mizugaki on 2015/02/13.
//  Copyright (c) 2015年 mzgk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *searchField;

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

    self.searchField.delegate = self;
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

}

- (void)applicationDidBecomeActive {
    [_searchField becomeFirstResponder];
}

// viewタップでキーボードの表示制御
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (_searchField.isFirstResponder) {
//        [self.view endEditing:YES];   // どちらでもOK
        [_searchField resignFirstResponder];
    }
    else {
        [_searchField becomeFirstResponder];
    }
}

// 改行キーでキーボード非表示（UITextFieldDelegateを利用）
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_searchField resignFirstResponder];
    return YES;
}

@end
