//
//  BaseWebViewController.h
//  SoftCard803
//
//  Created by apple on 15/3/12.
//  Copyright (c) 2015年 iOSlearning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseWebViewController : UIViewController<UIWebViewDelegate>
@property(nonatomic, retain)UIWebView *webView;
@property(nonatomic,strong)UIButton *goBackButton;
@property(nonatomic, strong)UIButton *goFowardButton;
@property(nonatomic, strong)UIButton *cancelButton;
@property(nonatomic, strong)UIActivityIndicatorView *indicator;

@end
