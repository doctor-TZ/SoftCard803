//
//  TheIconStore.h
//  SoftCard803
//
//  Created by apple on 15/3/12.
//  Copyright (c) 2015年 iOSlearning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TheIconStore : NSObject
@property(nonatomic, strong)NSMutableDictionary *dictionary;

+(TheIconStore *)defaultStore;

@end
