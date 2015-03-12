//
//  CardsTableDetailViewController.h
//  SoftCard803
//
//  Created by apple on 15/3/12.
//  Copyright (c) 2015年 iOSlearning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactInfo.h"
#import <MessageUI/MFMailComposeViewController.h>
@interface CardsTableDetailViewController : UIViewController<MFMailComposeViewControllerDelegate>

@property(nonatomic,strong)ContactInfo *item;
@end
