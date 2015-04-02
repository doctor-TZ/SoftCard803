//
//  LoginViewController.h
//  SoftCard803
//
//  Created by apple on 15/3/31.
//  Copyright (c) 2015年 iOSlearning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QRCodeReaderViewController.h"

@interface LoginViewController : UIViewController<QRCodeReaderDelegate>

- (IBAction)scanQRCode:(id)sender;

- (IBAction)openMyQRCode:(id)sender;
- (IBAction)openCardsTable:(id)sender;

- (IBAction)openMyCard:(id)sender;


@end
