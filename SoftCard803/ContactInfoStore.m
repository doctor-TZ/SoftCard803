//
//  ContactInfoStore.m
//  SoftCard803
//
//  Created by apple on 15/3/12.
//  Copyright (c) 2015年 iOSlearning. All rights reserved.
//

#import "ContactInfoStore.h"
@implementation ContactInfoStore
@synthesize array;

+(ContactInfoStore *)defaultStore{
    static ContactInfoStore *defaultStore = nil;
    if(!defaultStore){
        defaultStore = [[super allocWithZone:nil]init];
    }
    
    return defaultStore;
}

+(id)allocWithZone:(NSZone *)zone{
    return [self defaultStore];
}

-(id)init{
    /*
    NSString *path = [self itemArchivePath];
    array = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if(!array){
     */
    self = [super init];
    if(self){
        
        array = [[NSMutableArray alloc]init];
        
        for(int i = 0; i<17; i++){
            
            ContactInfo *item = [ContactInfo addExampleData];
            [array addObject:item];
        }
        
 
    }
    return self;
}



-(NSString *)itemArchivePath{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    
    return [documentDirectory stringByAppendingPathComponent:@"friendItems.archive"];
}

-(BOOL)saveChanges{
    
    NSString *path = [self itemArchivePath];
    return [NSKeyedArchiver archiveRootObject:array toFile:path];
}




@end
