//
//  LDMGAITracker.m
//  LDMAnalyticsTools
//
//  Created by Lobanov Dmitry on 18.02.13.
//
//

#import "LDMGAITracker.h"
#import "GAIDictionaryBuilder.h"
#import "GAIFields.h"
#import "GAI.h"
#import "LDMCustomGAIEventFactory.h"

static const CGFloat kGoogleAnalyticsDispathInterval = 30.0f; /*it is not optimal for battery usage, test*/

@implementation LDMGAITracker

#pragma mark - Initialization
- (instancetype)init{
    self = [super init];
    if (self){
        _tracker = [[GAI sharedInstance] defaultTracker];
    }
    return self;
}
- (instancetype)initWithTrackerID:(NSString *)trackerID{
    self = [super init];
    if (self){
        _tracker = [[GAI sharedInstance] trackerWithTrackingId:trackerID];
    }
    return self;
}
+ (instancetype)createGAITracker{
    return [[self alloc] init];
}
+ (instancetype)createGAITrackerWithTrackerID:(NSString*)trackerID{
    LDMGAITracker *tracker = [[self alloc] initWithTrackerID:trackerID];
    [tracker.tracker send:[[[GAIDictionaryBuilder createEventWithCategory:@"UX"
                                                                   action:@"appstart"
                                                                    label:nil
                                                                    value:nil] set:@"start" forKey:kGAISessionControl] build]];
    [tracker configureDefaultSettings];
    return tracker;
}
- (void)configureDefaultSettings{
    // Optional: automatically send uncaught exceptions to Google Analytics.
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
    [GAI sharedInstance].dispatchInterval = kGoogleAnalyticsDispathInterval;
    // Create tracker instance.
    
}


#pragma mark - Events Handling
- (void)sendEvent:(LDMCustomGAIEvent *)event{
    [self.tracker send:[[GAIDictionaryBuilder createEventWithCategory:event.eventCategory
                                                               action:event.eventAction
                                                                label:event.eventLabel
                                                                value:event.eventValueIs64bit] build]];
}
#pragma mark - Timing Handling
- (void)sendTiming:(LDMCustomGAIEvent *)timing{

    [self.tracker send:[[GAIDictionaryBuilder createTimingWithCategory:timing.timingCategory
                                                              interval:timing.timeInterval
                                                                  name:timing.timingName
                                                                 label:timing.timingLabel] build]];
}

#pragma mark - View Handling
- (void)sendViewWithName:(NSString *)viewName{
    [self.tracker set:kGAIScreenName value:viewName];
}

#pragma mark - Pool of events

- (void)fillEventPool{
    self.pullOfEvents = [LDMCustomGAIEventFactory allEvents];
    for (LDMCustomGAIEvent *event in self.pullOfEvents) {
        event.tracker = self;
    }
}


@end
