//
//  LDMBaseEventFactory.m
//  HowToUseAnalyticsTools
//
//  Created by Lobanov Dmitry on 24.12.14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import "LDMBaseEventFactory.h"

@implementation LDMBaseEventFactory

+(instancetype)createFactory {
    LDMBaseEventFactory* factory = [[self alloc] init];
    return factory;
}

+(NSArray*)allEvents {
    return [[self createFactory] allEvents];
}


@end
