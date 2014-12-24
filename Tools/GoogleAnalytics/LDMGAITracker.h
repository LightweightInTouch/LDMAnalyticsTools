//
//  LDMGAITracker.h
//  LDMAnalyticsTools
//
//  Created by Lobanov Dmitry on 18.02.13.
//
//

#import <Foundation/Foundation.h>
#import "GAITracker.h"
#import "LDMGAIEvent.h"
#import "LDMGAITiming.h"
#import "LDMBaseAnalyticsTracker.h"

@interface LDMGAITracker : LDMBaseAnalyticsTracker
/*this class is an adapter around GAI Library*/
@property (nonatomic,strong) id<GAITracker>tracker;

#pragma mark - Initialization
+ (instancetype)createGAITracker;
+ (instancetype)createGAITrackerWithTrackerID:(NSString *)trackerID;
#pragma mark - Events Handling
- (void)sendEvent:(LDMGAIEvent *)event;
#pragma mark - Timing Handling
- (void)sendTiming:(LDMGAITiming *)timing;
#pragma mark - View Handling
- (void)sendViewWithName:(NSString *)viewName;

@end
