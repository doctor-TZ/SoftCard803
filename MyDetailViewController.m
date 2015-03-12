//
//  MyDetailViewController.m
//  SoftCard803
//
//  Created by apple on 15/3/12.
//  Copyright (c) 2015年 iOSlearning. All rights reserved.
//

#import "MyDetailViewController.h"
#import "Common.h"
#import "TheMasterStore.h"
@interface MyDetailViewController ()


@property(nonatomic, strong)UITextField *nameField;
@property(nonatomic, strong)UITextField *jobDescriptionField;
@property(nonatomic, strong)UITextField *telePhoneField;
@property(nonatomic, strong)UITextField *mailAddressField;
@property(nonatomic, strong)UITextField *link1Field;
@property(nonatomic, strong)UITextField *link2Field;
@property(nonatomic, strong)UITextField *link3Field;
@property(nonatomic, strong)UITextField *link4Field;

@property(nonatomic, strong)ContactInfo *item;

@end

@implementation MyDetailViewController
@synthesize nameField, jobDescriptionField, telePhoneField, mailAddressField, link1Field, link2Field, link3Field, link4Field, item;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    //
    item = [[TheMasterStore defaultStore]item];
    
    CGFloat originX;
    CGFloat originY;
    CGFloat width;
    CGFloat height;
    //开始画线
    originX = 0;
    originY = 142;
    width = [UIScreen mainScreen].bounds.size.width;
    height = 0.5;
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(originX, originY, width, height)];
    [line setBackgroundColor:[UIColor colorWithRed:151/255.0 green:151/255.0 blue:151/255.0 alpha:1.0]];
    [self.view addSubview:line];
    
    originY += 65 + height;
    line = [[UIView alloc] initWithFrame:CGRectMake(originX, originY, width, height)];
    [line setBackgroundColor:[UIColor colorWithRed:151/255.0 green:151/255.0 blue:151/255.0 alpha:1.0]];
    [self.view addSubview: line];
    
    originY += 65 + height;
    line = [[UIView alloc] initWithFrame:CGRectMake(originX, originY, width, height)];
    [line setBackgroundColor:[UIColor colorWithRed:151/255.0 green:151/255.0 blue:151/255.0 alpha:1.0]];
    [self.view addSubview:line];
    
    originY += 65 + height;
    line = [[UIView alloc] initWithFrame:CGRectMake(originX, originY, width, height)];
    [line setBackgroundColor:[UIColor colorWithRed:151/255.0 green:151/255.0 blue:151/255.0 alpha:1.0]];
    [self.view addSubview:line];
    
    originY += 65 + height;
    line = [[UIView alloc] initWithFrame:CGRectMake(originX, originY, width, height)];
    [line setBackgroundColor:[UIColor colorWithRed:151/255.0 green:151/255.0 blue:151/255.0 alpha:1.0]];
    [self.view addSubview:line];
    
    originY += 65 + height;
    line = [[UIView alloc] initWithFrame:CGRectMake(originX, originY, width, height)];
    [line setBackgroundColor:[UIColor colorWithRed:151/255.0 green:151/255.0 blue:151/255.0 alpha:1.0]];
    [self.view addSubview:line];
    
    originY += 65 + height;
    line = [[UIView alloc] initWithFrame:CGRectMake(originX, originY, width, height)];
    [line setBackgroundColor:[UIColor colorWithRed:151/255.0 green:151/255.0 blue:151/255.0 alpha:1.0]];
    [self.view addSubview:line];
    
    originY += 65 + height;
    line = [[UIView alloc] initWithFrame:CGRectMake(originX, originY, width, height)];
    [line setBackgroundColor:[UIColor colorWithRed:151/255.0 green:151/255.0 blue:151/255.0 alpha:1.0]];
    [self.view addSubview:line];
    
    //开始画文本框
    originX = 27;
    originY = 75.75;
    width = SCREEN_WIDTH;
    height = 55;
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(originX, originY,width,height)];
    //[textField setBorderStyle:UITextBorderStyleLine];
    [textField setPlaceholder:@"姓名"];
    //[textField setBorderStyle:UITextBorderStyleLine];
    [textField setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
    nameField = textField;
    nameField.delegate = self;
    [self.view addSubview:nameField];
    nameField.text = item.name;
    
    
    originY += 11 + height;
    textField = [[UITextField alloc] initWithFrame:CGRectMake(originX, originY, width, height)];
    [textField setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
    [textField setDelegate:self];
    jobDescriptionField = textField ;
    jobDescriptionField.placeholder = @"个人简介";
    [self.view addSubview:jobDescriptionField];
    [jobDescriptionField setText:item.jobDescription];
    
    originY += 11 + height;
    textField = [[UITextField alloc] initWithFrame:CGRectMake(originX, originY, width, height)];
    //[textField setBorderStyle:UITextBorderStyleLine];
    [textField setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
    [textField setDelegate:self];
    telePhoneField = textField ;
    telePhoneField.placeholder = @"电话";
    [self.view addSubview:telePhoneField];
    telePhoneField.text = item.telePhoneNumber;
    
    originY += 11 + height;
    textField = [[UITextField alloc] initWithFrame:CGRectMake(originX, originY, width, height)];
    [textField setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
    [textField setDelegate:self];
    mailAddressField = textField ;
    mailAddressField.placeholder = @"邮件地址";
    [self.view addSubview:mailAddressField];
    mailAddressField.text = item.mailAddress;
    
    originY += 11 + height;
    textField = [[UITextField alloc] initWithFrame:CGRectMake(originX, originY, width, height)];
    [textField setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
    [textField setDelegate:self];
    link1Field = textField ;
    link1Field.placeholder = @"个人链接1";
    [self.view addSubview:link1Field];
    link1Field.text = item.link1Address;
    
    originY += 11 + height;
    textField = [[UITextField alloc] initWithFrame:CGRectMake(originX, originY, width, height)];
    [textField setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
    [textField setDelegate:self];
    link2Field = textField ;
    link2Field.placeholder = @"个人链接2";
    [self.view addSubview:link2Field];
    link2Field.text = item.link2Address;
    
    originY += 11 + height;
    textField = [[UITextField alloc] initWithFrame:CGRectMake(originX, originY, width, height)];
    [textField setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
    [textField setDelegate:self];
    link3Field = textField ;
    link3Field.placeholder = @"个人链接3";
    [self.view addSubview:link3Field];
    [link3Field setText:item.link3Address];
    
    originY += 11 + height;
    textField = [[UITextField alloc] initWithFrame:CGRectMake(originX, originY, width, height)];
    [textField setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
    [textField setDelegate:self];
    link4Field = textField ;
    link4Field.placeholder = @"个人链接4";
    [self.view addSubview:link4Field];
    [link4Field setText:item.link4Address];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardDidShowNotification object:nil];
    
}


-(void)keyboardWillShow:(NSNotification *)noti{
    NSDictionary *info = [noti userInfo];
    CGSize keyboardRect = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey]CGRectValue].size;
    UIScrollView *scroll = (UIScrollView *)self.view;
    //CGPoint new = CGPointMake(0,65);
    //[scroll setContentOffset:new animated:YES];
    CGRect aRect = self.view.frame;
    aRect.size.height -= keyboardRect.height;
    CGPoint telePhonePoint = CGPointMake(telePhoneField.frame.origin.x, telePhoneField.frame.origin.y + 100);
    if(!CGRectContainsPoint(aRect, self.mailAddressField.frame.origin) && [self.mailAddressField isFirstResponder]){
        CGPoint scrollPoint = CGPointMake(0.0, 160);
        [scroll setContentOffset:scrollPoint animated:YES];
    }else if (!CGRectContainsPoint(aRect, self.link1Field.frame.origin) && [self.link1Field isFirstResponder]){
        CGPoint scrollPoint = CGPointMake(0.0, 220);
        [scroll setContentOffset:scrollPoint animated:YES];
    }else if (!CGRectContainsPoint(aRect, self.link2Field.frame.origin) && [self.link2Field isFirstResponder]){
        CGPoint scrollPoint = CGPointMake(0.0, 300);
        [scroll setContentOffset:scrollPoint animated:YES];
    }else if(!CGRectContainsPoint(aRect, self.link3Field.frame.origin) && [self.link3Field isFirstResponder]){
        CGPoint scrollPoint = CGPointMake(0.0, 380);
        [scroll setContentOffset:scrollPoint animated:YES];
    }else if(!CGRectContainsPoint(aRect, self.link4Field.frame.origin) && [self.link4Field isFirstResponder]){
        CGPoint scrollPoint = CGPointMake(0.0, 460);
        [scroll setContentOffset:scrollPoint animated:YES];
    }else if(!CGRectContainsPoint(aRect, telePhonePoint) && [self.telePhoneField isFirstResponder]){
        CGPoint scrollPoint = CGPointMake(0.0, 80);
        [scroll setContentOffset:scrollPoint animated:YES];
    }
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    item.name = nameField.text;
    if(nameField.text == nil){
        item.name = @"姓名";
    }
    item.jobDescription = jobDescriptionField.text;
    if(jobDescriptionField == nil){
        item.jobDescription = @"个人简介";
    }
    item.telePhoneNumber = telePhoneField.text;
    item.mailAddress = mailAddressField.text;//这里是否需要加上地址判定规则?话说即使是错误的规则,用户在打开邮箱输邮件时,也可以进行更正呀~
    NSString *switchItem1;
    switchItem1 = link1Field.text;
    NSRange range = [switchItem1 rangeOfString:@"http://"];
    if(range.location != NSNotFound){
        item.link1Address = switchItem1;
    }else{
        NSString *newString = [NSString stringWithFormat:@"http://%@",switchItem1];
        item.link1Address = newString;
    }
    
    NSString *switchItem2;
    switchItem2 = link2Field.text;
    NSRange range2 = [switchItem2 rangeOfString:@"http://"];
    if(range2.location != NSNotFound){
        item.link2Address = switchItem2;
    }else{
        NSString *newString = [NSString stringWithFormat:@"http://%@",switchItem2];
        item.link2Address = newString;
    }
    
    NSString *switchItem3;
    switchItem3 = link3Field.text;
    NSRange range3 = [switchItem3 rangeOfString:@"http://"];
    if(range3.location != NSNotFound){
        item.link3Address = switchItem3;
    }else{
        NSString *newString = [NSString stringWithFormat:@"http://%@",switchItem3];
        item.link3Address = newString;
    }
    
    NSString *switchItem4;
    switchItem4 = link4Field.text;
    NSRange range4 = [switchItem4 rangeOfString:@"http://"];
    if(range4.location != NSNotFound){
        item.link4Address = switchItem4;
    }else{
        NSString *newString = [NSString stringWithFormat:@"http://%@",switchItem4];
        item.link4Address = newString;
    }
    
    
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
