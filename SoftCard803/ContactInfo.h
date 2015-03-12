//
//  ContactInfo.h
//  SoftCard803
//
//  Created by apple on 15/3/12.
//  Copyright (c) 2015年 iOSlearning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactInfo : NSObject<NSCoding>


@property(nonatomic, copy)NSString *name;
@property(nonatomic, copy)NSString *jobDescription;
@property(nonatomic, copy)NSString *telePhoneNumber;
@property(nonatomic, copy)NSString *mailAddress;

@property(nonatomic, copy)NSString *link1Address;
@property(nonatomic, copy)NSString *link2Address;
@property(nonatomic, copy)NSString *link3Address;
@property(nonatomic, copy)NSString *link4Address;

@property(nonatomic, copy)NSString *imageKey;

+(ContactInfo *)addExampleData;



@end
