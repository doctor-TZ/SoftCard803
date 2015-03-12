//
//  TheMasterStore.h
//  SoftCard803
//
//  Created by apple on 15/3/12.
//  Copyright (c) 2015年 iOSlearning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactInfo.h"

@interface TheMasterStore : NSObject
@property(nonatomic, strong)ContactInfo *item;

+(TheMasterStore *)defaultStore;
-(ContactInfo *)item;
-(NSString *)itemArchivePath;
-(BOOL)saveChanges;

@end
