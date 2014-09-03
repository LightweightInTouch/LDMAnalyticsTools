//
//  LDMAnalyticsTools.m
//  LDMAnalyticsTools
//
//  Created by Lobanov Dmitry on 15.02.13.
//
//

#import "LDMAnalyticsTools.h"

@implementation LDMAnalyticsTools

#pragma mark - Singleton

+ (instancetype)sharedInstance{
    static LDMAnalyticsTools *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}
- (LDMGAITracker *)googleAnalyticsTracker{
    if (!_googleAnalyticsTracker){
        _googleAnalyticsTracker = [LDMGAITracker createGAITrackerWithTrackerID:LDMGoogleAnalyticsID];
    }
    return _googleAnalyticsTracker;
}
- (LDMFlurryAnalyticsTracker *)flurryAnalyticsTracker{
    if (!_flurryAnalyticsTracker){
        _flurryAnalyticsTracker = [LDMFlurryAnalyticsTracker createKLFlurryTrackerWithAppID:LDMFlurryAnalyticsID];        
    }
    return _flurryAnalyticsTracker;
}

- (void)fillEventPool{
    [self.flurryAnalyticsTracker fillEventPool];
    [self.googleAnalyticsTracker fillEventPool];
}

+ (void)fillEventPool{
    [[self sharedInstance] fillEventPool];
}

@end
