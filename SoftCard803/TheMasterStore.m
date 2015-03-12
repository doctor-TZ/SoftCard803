//
//  TheMasterStore.m
//  SoftCard803
//
//  Created by apple on 15/3/12.
//  Copyright (c) 2015年 iOSlearning. All rights reserved.
//

#import "TheMasterStore.h"

@implementation TheMasterStore
@synthesize item;
+(TheMasterStore *)defaultStore{
    static TheMasterStore *store = nil;
    if(!store){
        store = [[super allocWithZone:nil]init];
    }
    return store;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self defaultStore];
}

-(id)init{
    self = [super init];
    if(self){
        NSString *path = [self itemArchivePath];
        item = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        if(!item){
            item = [[ContactInfo alloc]init];
            item.name = @"毕加索";
            item.jobDescription = @"画家,雕塑家,共产党员";
        }
    }
    return self;
}

-(ContactInfo *)item{
    return item;
}

-(NSString *)itemArchivePath{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    
    return [documentDirectory stringByAppendingPathComponent:@"masterItem.archive"];
}

-(BOOL)saveChanges{
    NSString *path = [self itemArchivePath];
    return [NSKeyedArchiver archiveRootObject:item toFile:path];
}



@end
