//
//  ContactInfoStore.h
//  SoftCard803
//
//  Created by apple on 15/3/12.
//  Copyright (c) 2015年 iOSlearning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactInfo.h"

@interface ContactInfoStore : NSObject

@property(nonatomic, strong)NSMutableArray *array;

+(ContactInfoStore *)defaultStore;
-(BOOL)saveChanges;

@end
