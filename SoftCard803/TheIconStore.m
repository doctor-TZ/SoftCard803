//
//  TheIconStore.m
//  SoftCard803
//
//  Created by apple on 15/3/12.
//  Copyright (c) 2015年 iOSlearning. All rights reserved.
//

#import "TheIconStore.h"
#import <UIKit/UIKit.h>
@implementation TheIconStore
@synthesize dictionary;

+(TheIconStore *)defaultStore{
    static TheIconStore *store = nil;
    if(!store){
        store = [[super allocWithZone:nil]init];
    }
    return store;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self defaultStore];
}

-(id)init{
    
    dictionary = [[NSMutableDictionary alloc]init];
    UIImage *image;
    NSString *key;
    image = [UIImage imageNamed:@"taobao F.png"];
    key = @"user.qzone.qq.com";
    [dictionary setObject:image forKey:key];
    
    image = [UIImage imageNamed:@"zhihu F.png"];
    key = @"www.zhihu.com";
    [dictionary setObject:image forKey:key];
    
    image = [UIImage imageNamed:@"youku F.png"];
    key = @"i.youku.com";
    [dictionary setObject:image forKey:key];
    
    image = [UIImage imageNamed:@"douban F.png"];
    key = @"www.douban.com";
    [dictionary setObject:image forKey:key];
    
    image = [UIImage imageNamed:@"renren F.png"];
    key = @"www.renren.com";
    [dictionary setObject:image forKey:key];
    
    image = [UIImage imageNamed:@"linkedin F.png"];
    key = @"www.linkedin.com";
    [dictionary setObject:image forKey:key];
    
    image = [UIImage imageNamed:@"instagram F.png"];
    key = @"www.instagram.com";
    [dictionary setObject:image forKey:key];
    
    image = [UIImage imageNamed:@"facebook F.png"];
    key = @"www.facebook.com";
    [dictionary setObject:image forKey:key];
    
    image = [UIImage imageNamed:@"twitter F.png"];
    key = @"www.twitter.com";
    [dictionary setObject:image forKey:key];
    
    image = [UIImage imageNamed:@"googleplus F.png"];
    key = @"plus.google.com";
    [dictionary setObject:image forKey:key];
    
    image = [UIImage imageNamed:@"dribbble F.png"];
    key = @"www.dribbble.com";
    [dictionary setObject:image forKey:key];
    
    image = [UIImage imageNamed:@"tumblr F.png"];
    key = @"www.tumblr.com";
    [dictionary setObject:image forKey:key];
    
    image = [UIImage imageNamed:@"quora F.png"];
    key = @"www.quora.com";
    [dictionary setObject:image forKey:key];
    
    image = [UIImage imageNamed:@"weibo F.png"];
    key = @"weibo.com";
    [dictionary setObject:image forKey:key];
    
    image = [UIImage imageNamed:@"pinterest F.png"];
    key = @"www.pinterest.com";
    [dictionary setObject:image forKey:key];
    
    image = [UIImage imageNamed:@"qzone F.png"];
    key = @"user.qzone.qq.com";
    [dictionary setObject:image forKey:key];
    /*
     image = [UIImage imageNamed:@"douban F.png"];
     key = @"www.douban.com";
     [dictionary setObject:image forKey:key];
     
     image = [UIImage imageNamed:@"douban F.png"];
     key = @"www.douban.com";
     [dictionary setObject:image forKey:key];
     
     image = [UIImage imageNamed:@"douban F.png"];
     key = @"www.douban.com";
     [dictionary setObject:image forKey:key];
     
     image = [UIImage imageNamed:@"douban F.png"];
     key = @"www.douban.com";
     [dictionary setObject:image forKey:key];
     
     image = [UIImage imageNamed:@"douban F.png"];
     key = @"www.douban.com";
     [dictionary setObject:image forKey:key];
     
     image = [UIImage imageNamed:@"douban F.png"];
     key = @"www.douban.com";
     [dictionary setObject:image forKey:key];
     
     image = [UIImage imageNamed:@"douban F.png"];
     key = @"www.douban.com";
     [dictionary setObject:image forKey:key];
     
     image = [UIImage imageNamed:@"douban F.png"];
     key = @"www.douban.com";
     [dictionary setObject:image forKey:key];
     
     image = [UIImage imageNamed:@"douban F.png"];
     key = @"www.douban.com";
     [dictionary setObject:image forKey:key];
     
     image = [UIImage imageNamed:@"douban F.png"];
     key = @"www.douban.com";
     [dictionary setObject:image forKey:key];
     
     image = [UIImage imageNamed:@"douban F.png"];
     key = @"www.douban.com";
     [dictionary setObject:image forKey:key];
     
     image = [UIImage imageNamed:@"douban F.png"];
     key = @"www.douban.com";
     [dictionary setObject:image forKey:key];
     
     image = [UIImage imageNamed:@"douban F.png"];
     key = @"www.douban.com";
     [dictionary setObject:image forKey:key];
     
     image = [UIImage imageNamed:@"douban F.png"];
     key = @"www.douban.com";
     [dictionary setObject:image forKey:key];
     
     image = [UIImage imageNamed:@"douban F.png"];
     key = @"www.douban.com";
     [dictionary setObject:image forKey:key];
     
     image = [UIImage imageNamed:@"douban F.png"];
     key = @"www.douban.com";
     [dictionary setObject:image forKey:key];
     
     image = [UIImage imageNamed:@"douban F.png"];
     key = @"www.douban.com";
     [dictionary setObject:image forKey:key];
     
     image = [UIImage imageNamed:@"douban F.png"];
     key = @"www.douban.com";
     [dictionary setObject:image forKey:key];
     
     image = [UIImage imageNamed:@"douban F.png"];
     key = @"www.douban.com";
     [dictionary setObject:image forKey:key];
     
     image = [UIImage imageNamed:@"douban F.png"];
     key = @"www.douban.com";
     [dictionary setObject:image forKey:key];
     
     image = [UIImage imageNamed:@"douban F.png"];
     key = @"www.douban.com";
     [dictionary setObject:image forKey:key];
     
     image = [UIImage imageNamed:@"douban F.png"];
     key = @"www.douban.com";
     [dictionary setObject:image forKey:key];
     */
    
    return self;
}

@end
