//
//  CardsTableViewController.m
//  SoftCard803
//
//  Created by apple on 15/3/12.
//  Copyright (c) 2015年 iOSlearning. All rights reserved.
//

#import "CardsTableViewController.h"
#import "ContactInfo.h"
#import "CardsTableDetailViewController.h"
#import "MyQRCodeViewController.h"
@interface CardsTableViewController ()

@property(nonatomic,strong)UIImageView *backgroundImage;
@end

@implementation CardsTableViewController
@synthesize data;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *imageUnselected = [UIImage imageNamed:@"名片夹.png"];//系统只有一种颜色可以进行染色
    UIImage *imageSelected = [UIImage imageNamed:@"名片夹.png"];//系统只有一种颜色
    
    UITabBarItem *firstTab = [[UITabBarItem alloc]initWithTitle:@"卡片夹" image:imageUnselected selectedImage:imageSelected];
    
    self.tabBarItem = firstTab;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:@"扫一扫"];
    CGFloat originX = 19.5;
    CGFloat originY = 15.5;
    CGFloat width = 30;
    CGFloat height = 30;
    [button setFrame:CGRectMake(originX, originY, width, height)];
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(scanQRCode:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    [self.navigationItem setTitle:@"卡片"];
    
    image = [UIImage imageNamed:@"我的二维码"];
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    originX = 270.5;
    originY = 18.5;
    [button setFrame:CGRectMake(originX, originY, width, height)];
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(openMyQRCode:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    data = [ContactInfoStore defaultStore];
    
    
    if ([data.array count] == 0) {
        self.backgroundImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"初始化背景.png"]];
        self.tableView.backgroundView = nil;
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:self.backgroundImage];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[data array]count];

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    
    
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellIdentifier"];
    }
    
    ContactInfo *item = [data.array objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:18.0];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:13.0];
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = item.jobDescription;
  
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        [data.array removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];    }
}


-(void)scanQRCode:(id)sender{
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

-(void)openMyQRCode:(id)sender{
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
        [self.backgroundImage removeFromSuperview];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [self.tableView reloadData];
        
    }];
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CardsTableDetailViewController *controller = [[CardsTableDetailViewController alloc] init];
    
    ContactInfo *item = [data.array objectAtIndex:indexPath.row];
    controller.item = item;
    [controller setHidesBottomBarWhenPushed:YES];
    
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)readerDidCancel:(QRCodeReaderViewController *)reader{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
