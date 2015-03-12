//
//  MyQRCodeViewController.m
//  SoftCard803
//
//  Created by apple on 15/3/12.
//  Copyright (c) 2015年 iOSlearning. All rights reserved.
//

#import "MyQRCodeViewController.h"

#import "TheMasterStore.h"
#import "QRCodeGenerator.h"
#import "ContactInfo.h"
#import "Common.h"

@interface MyQRCodeViewController ()

@end

@implementation MyQRCodeViewController
@synthesize imageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我的二维码";
    imageView = [[UIImageView alloc]init];
    CGFloat orginX;
    CGFloat orginY;
    CGFloat width;
    CGFloat height;
    
    
    
    if(IS_IPHONE_6_SCREEN){
        orginX = (375 - 375/2)/2;
        orginY = 293/2;
        width = 375/2;
        height = 375/2;
        
    }else{
        orginX = 66.5;
        orginY = 293/2;
        width = 375/2;
        height = 375/2;
        
    }
    [imageView setFrame:CGRectMake(orginX, orginY, width, height)];
    
    ContactInfo *item = [[TheMasterStore defaultStore] item];
    
    NSString *new = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n",item.name, item.jobDescription, item.telePhoneNumber, item.mailAddress, item.link1Address, item.link2Address, item.link3Address, item.link4Address];
    
    imageView.image = [QRCodeGenerator qrImageForString:new imageSize:self.imageView.bounds.size.width];
    [self.view addSubview:imageView];
    
    UIImage *image = [UIImage imageNamed:@"QRCodeBackground.png"];
    
    UIImageView *backgroundImage = [[UIImageView alloc]initWithImage:image];
    if(IS_IPHONE_6_SCREEN) {
        orginX = 51 + 27.5;
        orginY = 131;
        width = 215.5;
        height = 215.5;
    }else{
        orginX = 51;
        orginY = 131;
        width = 215.5;
        height = 215.5;
    }
    [backgroundImage setFrame:CGRectMake(orginX, orginY, width, height)];
    [self.view addSubview:backgroundImage];
    if(IS_IPHONE_6_SCREEN) {
        orginX = 0;
        orginY = 371;
        width = 375;
        height = 17.5;
    }else{
        orginX = 0;
        orginY = 371;
        width = 320;
        height = 17.5;
        
    }
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(orginX, orginY, width, height)];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont systemFontOfSize:17.0]];
    [label setText:@"扫一扫添加到我的卡片夹"];
    [label setTextColor:[UIColor colorWithWhite:77/255.0 alpha:1.0]];
    [self.view addSubview:label];
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
