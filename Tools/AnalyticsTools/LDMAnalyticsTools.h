//
//  LDMAnalyticsTools.h
//  LDMAnalyticsTools
//
//  Created by Lobanov Dmitry on 15.02.13.
//
//

#import <Foundation/Foundation.h>
#import "LDMBaseAnalyticsTracker.h"
#import "LDMMixpanelTracker.h"
#import "LDMGAITracker.h"
#import "LDMFlurryAnalyticsTracker.h"

extern NSString* const LDMAnalyticsTrackerIDKey;
extern NSString* const LDMAnalyticsAppicationServiceIDKey;
extern NSString* const LDMAnalyticsEventsArrayKey;
extern NSString* const LDMAnalyticsEventFactoryKey;
extern NSString* const LDMAnalyticsTrackerIDValueGoogleAnalytics;
extern NSString* const LDMAnalyticsTrackerIDValueFlurryAnalytics;
extern NSString* const LDMAnalyticsTrackerIDValueMixpanel;

@interface LDMAnalyticsTools : NSObject

+ (instancetype)sharedInstance;
// setup this dictionary first
// [LDMAnalyticsTools sharedInstance].keys =
// @{ @"googleAnalyticsTracker" : @"LDMGoogleAnalytcsID",
//    @"flurryAnalyticsTracker" : @"LDMFlurryAnalyticsID"
// };
// that's all!
// [LDMAnalyticsTools fillEventPool];
@property (nonatomic,strong) NSDictionary* keys;
@property (nonatomic,strong) NSArray* allUnnamedTrackersDictionaries;
@property (nonatomic,strong) NSDictionary* allUnnamedTrackers;
@property (nonatomic,strong) LDMGAITracker *googleAnalyticsTracker;
@property (nonatomic,strong) LDMFlurryAnalyticsTracker *flurryAnalyticsTracker;

- (void)fillEventPool;
+ (void)fillEventPool;

@end
