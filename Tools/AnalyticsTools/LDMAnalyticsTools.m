//
//  LDMAnalyticsTools.m
//  LDMAnalyticsTools
//
//  Created by Lobanov Dmitry on 15.02.13.
//
//

#import "LDMAnalyticsTools.h"

NSString* const LDMAnalyticsTrackerIDKey = @"LDMAnalyticsTrackerIDKey";
NSString* const LDMAnalyticsAppicationServiceIDKey = @"LDMAnalyticsAppicationServiceIDKey";
NSString* const LDMAnalyticsEventsArrayKey = @"LDMAnalyticsEventsArrayKey";
NSString* const LDMAnalyticsEventFactoryKey = @"LDMAnalyticsEventFactoryKey";
NSString* const LDMAnalyticsTrackerIDValueGoogleAnalytics = @"LDMAnalyticsTrackerIDValueGoogleAnalytics";
NSString* const LDMAnalyticsTrackerIDValueFlurryAnalytics = @"LDMAnalyticsTrackerIDValueFlurryAnalytics";
NSString* const LDMAnalyticsTrackerIDValueMixpanel = @"LDMAnalyticsTrackerIDValueMixpanel";


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
        _googleAnalyticsTracker = [LDMGAITracker createGAITrackerWithTrackerID:self.keys[@"googleAnalyticsTracker"]];
    }
    return _googleAnalyticsTracker;
}
- (LDMFlurryAnalyticsTracker *)flurryAnalyticsTracker{
    if (!_flurryAnalyticsTracker){
        _flurryAnalyticsTracker = [LDMFlurryAnalyticsTracker createFlurryTrackerWithAppID:self.keys[@"flurryAnalyticsTracker"]];
    }
    return _flurryAnalyticsTracker;
}

- (LDMMixpanelTracker*)mixpanelTrackerFromDictionary:(NSDictionary*)trackerDictionary {
    LDMMixpanelTracker* newTracker = nil;
    if ([trackerDictionary[LDMAnalyticsTrackerIDKey] isEqualToString:LDMAnalyticsTrackerIDValueMixpanel]) {
        // so, let's create google analytics here
        newTracker = [LDMMixpanelTracker createTrackerWithAppID:trackerDictionary[LDMAnalyticsAppicationServiceIDKey]];
        
        NSArray* events = trackerDictionary[LDMAnalyticsEventsArrayKey];
        if ([events isKindOfClass:[NSArray class]]) {
            newTracker.eventPool = events;
        }
    }
    
    return newTracker;
}

- (LDMGAITracker*)googleTrackerFromDictionary:(NSDictionary*)trackerDictionary {
    LDMGAITracker* newTracker = nil;
    if ([trackerDictionary[LDMAnalyticsTrackerIDKey] isEqualToString:LDMAnalyticsTrackerIDValueGoogleAnalytics]) {
        // so, let's create google analytics here
        newTracker = [LDMGAITracker createTrackerWithAppID:trackerDictionary[LDMAnalyticsAppicationServiceIDKey]];

        NSArray* events = trackerDictionary[LDMAnalyticsEventsArrayKey];
        if ([events isKindOfClass:[NSArray class]]) {
            newTracker.eventPool = events;
        }
    }

    return newTracker;
}

- (LDMFlurryAnalyticsTracker*)flurryTrackerFromDicitonary:(NSDictionary*)trackerDictionary{
    LDMFlurryAnalyticsTracker* newTracker = nil;
    if ([trackerDictionary[LDMAnalyticsTrackerIDKey] isEqualToString:LDMAnalyticsTrackerIDValueFlurryAnalytics]) {

        newTracker = [LDMFlurryAnalyticsTracker createTrackerWithAppID:trackerDictionary[LDMAnalyticsAppicationServiceIDKey]];
        
        NSArray* events = trackerDictionary[LDMAnalyticsEventsArrayKey];
        if ([events isKindOfClass:[NSArray class]]) {
            newTracker.eventPool = events;
        }
    }

    return newTracker;
}

- (LDMBaseAnalyticsTracker*)trackerFromDictionary:(NSDictionary*)trackerDictionary {
    LDMBaseAnalyticsTracker* newTracker = nil;
    newTracker = [self googleTrackerFromDictionary:trackerDictionary];
    newTracker = newTracker ? newTracker : [self flurryTrackerFromDicitonary:trackerDictionary];
    newTracker = newTracker ? newTracker : [self mixpanelTrackerFromDictionary:trackerDictionary];
    return newTracker;
}

- (void)fillEventPool{
    NSMutableDictionary* newDictionary = [@{} mutableCopy];
    
    for (NSDictionary* trackerDictionary in self.allUnnamedTrackersDictionaries) {
        // determine tracker, his events
        LDMBaseAnalyticsTracker* newTracker = [self trackerFromDictionary:trackerDictionary];
        if (newTracker) {
            
            NSString* stringID = [NSString stringWithFormat:@"tracker_%@_key_%@",trackerDictionary[LDMAnalyticsTrackerIDKey],trackerDictionary[LDMAnalyticsAppicationServiceIDKey]];
            
            newDictionary[stringID] = newTracker;
        }
    }
    
    self.allUnnamedTrackers = [newDictionary copy];
    
    for (NSString* key in self.allUnnamedTrackers) {
        LDMBaseAnalyticsTracker* tracker = (LDMBaseAnalyticsTracker*)
        self.allUnnamedTrackers[key];
        [tracker fillEventPool];
    }
    
    [self.flurryAnalyticsTracker fillEventPool];
    [self.googleAnalyticsTracker fillEventPool];
}

+ (void)fillEventPool{
    [[self sharedInstance] fillEventPool];
}

@end
