//
//  LDMBaseAnalyticsTracker.m
//  HowToUseAnalyticsTools
//
//  Created by Lobanov Dmitry on 24.12.14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import "LDMBaseAnalyticsTracker.h"

@implementation LDMBaseAnalyticsTracker

+ (instancetype) createTrackerWithAppID:(NSString*)appID
{
    LDMBaseAnalyticsTracker* baseTracker = [[self alloc] init];
    if (baseTracker) {
        // do something
    }
    return baseTracker;
}

- (LDMBaseEventFactory*)eventFactory {
    if (!_eventFactory) {
        _eventFactory = [LDMBaseEventFactory createFactory];
    }
    return _eventFactory;
}

- (void)fillEventPool {
    // fill pool of events somehow
    if (!_eventPool) {
        _eventPool = [self.eventFactory allEvents];
    }
}

@end
