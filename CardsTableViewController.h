//
//  CardsTableViewController.h
//  SoftCard803
//
//  Created by apple on 15/3/12.
//  Copyright (c) 2015年 iOSlearning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactInfoStore.h"
#import "QRCodeReaderViewController.h"
@interface CardsTableViewController : UITableViewController<QRCodeReaderDelegate>
@property(nonatomic,strong)ContactInfoStore *data;
@end
