//
//  LDMMixpanelTracker.m
//  HowToUseAnalyticsTools
//
//  Created by Lobanov Dmitry on 24.12.14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import "LDMMixpanelTracker.h"
static NSUInteger defaultFlushInterval = 30;

@implementation LDMMixpanelTracker

#pragma mark - Initialization
+ (instancetype)createTrackerWithAppID:(NSString *)appID{

    LDMMixpanelTracker* newTracker = [self createMixpanelTrackerWithAppID:appID andLaunchOptions:nil andFlushInterval:defaultFlushInterval];
    [newTracker defaultSetup];
    return newTracker;
}

- (void)defaultSetup {
    self.eventFactory = [LDMMixpanelEventFactory createFactory];
}

+ (instancetype)createMixpanelTrackerWithAppID:(NSString *)appID andLaunchOptions:(NSDictionary*)options andFlushInterval:(NSUInteger)interval {
    
    LDMMixpanelTracker* newTracker = [[self alloc] init];
    newTracker.tracker = [[Mixpanel alloc] initWithToken:appID launchOptions:options andFlushInterval:interval];
    return newTracker;
}

#pragma mark - Events

- (void)trackEvent:(LDMMixpanelEvent*)event{
    [self.tracker track:event.eventName properties:event.eventParameters];
}

- (void)fillEventPool {
    for (LDMMixpanelEvent *event in self.eventPool) {
        event.tracker = self;
    }

}

@end
