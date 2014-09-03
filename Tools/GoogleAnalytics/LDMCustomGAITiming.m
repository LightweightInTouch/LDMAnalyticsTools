//
//  LDMCustomGAITiming.m
//  LDMAnalyticsTools
//
//  Created by Lobanov Dmitry on 19.03.13.
//
//

#import "LDMCustomGAITiming.h"

@implementation LDMCustomGAITiming

#pragma mark - Initialization

+(instancetype)createTiming{
    return  [[self alloc] init];
}
+(instancetype)createTimingWithCategory:(NSString *)category
                                        withName:(NSString *)name
                                       withLabel:(NSString *)label
                                withTimeInterval:(NSNumber *)value{

    LDMCustomGAITiming* timing = [self createTiming];
    timing.timingCategory = category;
    timing.timingName     = name;
    timing.timingLabel    = label;
    timing.timeInterval   = value;
    return timing;
}

-(void)subscribeOnNotification:(NSString *)name{
    self.notificationName = name;
}


@end
