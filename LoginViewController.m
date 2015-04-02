//
//  LoginViewController.m
//  SoftCard803
//
//  Created by apple on 15/3/31.
//  Copyright (c) 2015年 iOSlearning. All rights reserved.
//

#import "LoginViewController.h"

#import "ContactInfo.h"
#import "Common.h"
#import "TheIconStore.h"
#import "ContactInfoStore.h"
#import "MyQRCodeViewController.h"
#import "MyCardViewController.h"
#import "CardsTableViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)scanQRCode:(id)sender {
    static QRCodeReaderViewController *reader = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken,^{
        reader = [QRCodeReaderViewController new];
        reader.modalPresentationStyle = UIModalPresentationFormSheet;
    });
    reader.delegate = self;
    [reader setCompletionWithBlock:^(NSString *resultAsString){
        
    }];
    [self presentViewController:reader animated:YES completion:nil];
}

- (IBAction)openMyQRCode:(id)sender {
    MyQRCodeViewController *controller = [[MyQRCodeViewController alloc]init];
    [controller setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)reader:(QRCodeReaderViewController *)reader didScanResult:(NSString *)result{
    
    [self dismissViewControllerAnimated:YES completion:^{
        ContactInfo *item = [[ContactInfo alloc] init];
        NSArray *array = [result componentsSeparatedByString:@"\n"];
        item.name = array[0];
        item.jobDescription = array[1];
        item.telePhoneNumber = array[2];
        item.mailAddress = array[3];
        item.link1Address = array[4];
        item.link2Address = array[5];
        item.link3Address = array[6];
        item.link4Address = array[7];
        
        NSString *message = [NSString stringWithFormat:@"添加%@到卡片",item.name];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"卡片组" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [[[ContactInfoStore defaultStore]array] addObject:item];
        
        
    }];
    
    
}

- (IBAction)openCardsTable:(id)sender {
    CardsTableViewController *controller = [[CardsTableViewController alloc]init];
   
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)openMyCard:(id)sender {
    MyCardViewController *controller = [[MyCardViewController alloc]init];
    
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)readerDidCancel:(QRCodeReaderViewController *)reader{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
