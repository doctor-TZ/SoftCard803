//
//  ContactInfo.m
//  SoftCard803
//
//  Created by apple on 15/3/12.
//  Copyright (c) 2015年 iOSlearning. All rights reserved.
//

#import "ContactInfo.h"

@implementation ContactInfo
@synthesize name, jobDescription, telePhoneNumber, mailAddress, link1Address, link2Address,link3Address,link4Address, imageKey;

-(NSString *)description{
    NSString *str = [NSString stringWithFormat:@"%@\n%@", name, jobDescription];
    return str;
}
//创建一个生成随机实例的类方法
//想生成一个怎样的随机数
//如果不传入参数,使用某方法,可以每次生成一个名字不重复,职业不重复,电话号码不重复,其他信息不重复的东西就可以了
//想要生成这样一个结果,初步的方法是在一堆数据里随机挑选,如果数据足够大,可以直接使用随机方法,如果数据不够大,为数据制造交叉方法
+(ContactInfo *)addExampleData{
    
    NSArray *nameList = [[NSArray alloc]initWithObjects:@"汪大东",@"曹博文",@"杨逍",@"无畏",@"李翔",@"达达",@"刘晓晓",@"胡天朔",@"吴楠",@"娄良",@"堪斌",@"地卜师",@"乘锦", @"戈佳",@"刘囧",@"关梅梅",@"王晓晓",nil];
    
    
    NSArray *JobList = [[NSArray alloc] initWithObjects:@"365好老师产品经理",@"51信用卡管家java开发工程师",@"阿里巴巴产品经理",@"前微软交互设计师",@"上门帮平面设计师",@"",@"蘑菇街JAVA开发工程师",@"数据架构师",@"帮亿帮信息科技RP经理",@"网店美编",@"网站编辑",@"优惠宝网页设计师",@"58同城高级Android开发工程师",@"淘宝网自身前端工程师",@"UC浏览器资深研发工程师",@"比邻iOS工程师",@"腾讯运营开发工程师",nil];
    //产品不应该如此自发的联想,而应该去揣摩用户的需要.
    
    NSString *web1 = @"http://www.zhihu.com/people/jiaoshoutv";
    NSString *web2 = @"http://www.zhihu.com/people/wu-nan-80";
    NSString *web3 = @"http://www.zhihu.com/people/rednaxelafx";
    NSString *web4 = @"http://www.zhihu.com/people/shenbin";
    NSString *web5 = @"http://www.zhihu.com/people/sizhuren";
    NSString *web6 = @"http://www.zhihu.com/people/nan-jun-77";
    NSString *web7 = @"http://www.zhihu.com/people/di-bu-shi-32";
    NSString *web8 = @"http://www.zhihu.com/people/bu-ke-qi-niang-zi";
    NSString *web9 = @"http://www.zhihu.com/people/bigeast";
    NSArray *webList = @[web1,web2,web3,web4,web5,web6,web7,web8,web9];
    ContactInfo *item = [[ContactInfo alloc]init];
    
    int r = arc4random()%17;
    int m = arc4random()%9;
    item.name = nameList[r];
    item.jobDescription = JobList[r];
    item.telePhoneNumber = @"13331099476";
    item.mailAddress = @"dukuzu@163.com";
    item.link1Address = webList[m];
    
    return item;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:name forKey:@"name"];
    [aCoder encodeObject:jobDescription forKey:@"jobDescription"];
    [aCoder encodeObject:telePhoneNumber forKey:@"telePhoneNumber"];
    [aCoder encodeObject:mailAddress forKey:@"mailAddress"];
    [aCoder encodeObject:link1Address forKey:@"link1Address"];
    [aCoder encodeObject:link2Address forKey:@"link2Address"];
    [aCoder encodeObject:link3Address forKey:@"link3Address"];
    [aCoder encodeObject:link4Address forKey:@"link4Address"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self){
        [self setName:[aDecoder decodeObjectForKey:@"name"]];
        [self setJobDescription:[aDecoder decodeObjectForKey:@"jobDescription"]];
        [self setTelePhoneNumber:[aDecoder decodeObjectForKey:@"telePhoneNumber"]];
        [self setMailAddress:[aDecoder decodeObjectForKey:@"mailAddress"]];
        [self setLink1Address:[aDecoder decodeObjectForKey:@"link1Address"]];
        [self setLink2Address:[aDecoder decodeObjectForKey:@"link2Address"]];
        [self setLink3Address:[aDecoder decodeObjectForKey:@"link3Address"]];
        [self setLink4Address:[aDecoder decodeObjectForKey:@"link4Address"]];
    }
    return self;
}




@end
