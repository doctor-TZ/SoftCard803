//
//  BaseWebViewController.m
//  SoftCard803
//
//  Created by apple on 15/3/12.
//  Copyright (c) 2015年 iOSlearning. All rights reserved.
//

#import "BaseWebViewController.h"
#import "Common.h"
@interface BaseWebViewController ()

@end

@implementation BaseWebViewController


-(id)init{
    self = [super init];
    if(self){
        webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 44)];
        [webView setScalesPageToFit:YES];
        
        [self.webView setDelegate:self];
        [self.view addSubview:webView];
    }
    return self;
}


@synthesize webView,goBackButton,goFowardButton,cancelButton;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat originX;
    CGFloat originY;
    CGFloat width;
    CGFloat height;
    if(IS_IPHONE_6_SCREEN){
        originX = 0;
        originY = 623;
        width = 375;
        height = 44;
    }else{
        originX = 0;
        originY = 436;
        width = 320;
        height = 44;
    }
    
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(originX, originY, width, height)];
    [bottomView setBackgroundColor:[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1.0]];
    [bottomView.layer setShadowOffset:CGSizeMake(10, 10)];
    
    [self.view addSubview:bottomView];
    
    if(IS_IPHONE_6_SCREEN){
        originX = 146.5;
        originY = 623;
        width = 44;
        height = 44;
    }else{
        originX = 146.5;
        originY = 436;
        width = 44;
        height = 44;
    }
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(originX,originY,width,height)];
    
    UIImage *image = [[UIImage alloc]init];
    
    image = [UIImage imageNamed:@"goBackDisabled.png"];
    [button setBackgroundImage:image forState:UIControlStateDisabled];
    
    image = [UIImage imageNamed:@"goBackEnabled.png"];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goBackAction:) forControlEvents:UIControlEventTouchUpInside];
    goBackButton = button;
    [goBackButton setEnabled:NO];
    [self.view addSubview:goBackButton];
    
    
    originX = 209;
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(originX,originY, width, height)];
    image = [UIImage imageNamed:@"goForwardDisabled"];
    [button setBackgroundImage:image forState:UIControlStateDisabled];
    image = [UIImage imageNamed:@"goForwardEnabled.png"];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setEnabled:NO];
    [button addTarget:self action:@selector(goFowardAction:) forControlEvents:UIControlEventTouchUpInside];
    goFowardButton = button;
    [self.view addSubview:goFowardButton];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    originX = 276;
    [button setFrame:CGRectMake(originX, originY, width, height)];
    image = [UIImage imageNamed:@"cancelEnabled.png"];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    [button setEnabled:YES];
    cancelButton = button;
    [self.view addSubview:cancelButton];
    
    
    originX = 0;
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [indicator setFrame:CGRectMake(originX, originY, width, height)];
    [self.view addSubview:indicator];
    [indicator setHidden:YES];
    self.indicator = indicator;
    
}

-(void)goBackAction:(id)sender{
    if(webView.canGoBack){
        [webView goBack];
    }
}

-(void)goFowardAction:(id)sender{
    if(webView.canGoForward){
        [webView goForward];
    }
}


-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;

    
}


-(void)webViewDidStartLoad:(UIWebView *)webView{
    //[[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:YES];
    self.indicator.hidden = NO;
    
}

-(void)webViewDidFinishLoad:(UIWebView *)web{
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:NO];
    
    [goBackButton setEnabled:web.canGoBack];
    
    [goFowardButton setEnabled:web.canGoForward];
    [self.indicator setHidden:YES];
    
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"WebKitCacheModelPreferenceKey"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"WebKitDiskImageCacheEnabled"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"WebKitOfflineWebApplicationCacheEnabled"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

-(void)cancel:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
