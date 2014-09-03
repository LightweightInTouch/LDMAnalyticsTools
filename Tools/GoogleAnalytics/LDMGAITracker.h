//
//  LDMGAITracker.h
//  LDMAnalyticsTools
//
//  Created by Lobanov Dmitry on 18.02.13.
//
//

#import <Foundation/Foundation.h>
#import "GAITracker.h"
#import "LDMCustomGAIEvent.h"
#import "LDMCustomGAITiming.h"

@interface LDMGAITracker : NSObject
/*this class is an adapter around GAI Library*/
@property (nonatomic,strong) id<GAITracker>tracker;

#pragma mark - Initialization
+ (instancetype)createGAITracker;
+ (instancetype)createGAITrackerWithTrackerID:(NSString *)trackerID;
#pragma mark - Events Handling
- (void)sendEvent:(LDMCustomGAIEvent *)event;
#pragma mark - Timing Handling
- (void)sendTiming:(LDMCustomGAITiming *)timing;
#pragma mark - View Handling
- (void)sendViewWithName:(NSString *)viewName;

//#pragma mark - Analytics Deployments

#pragma mark - Pull of events
@property (nonatomic, strong) NSArray *pullOfEvents;

- (void)fillEventPool;


@end
