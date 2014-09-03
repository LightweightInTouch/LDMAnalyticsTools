//
//  LDMAnalyticsTools.h
//  LDMAnalyticsTools
//
//  Created by Lobanov Dmitry on 15.02.13.
//
//

#import <Foundation/Foundation.h>
#import "LDMGAITracker.h"
#import "LDMFlurryAnalyticsTracker.h"

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
@property (nonatomic,strong) LDMGAITracker *googleAnalyticsTracker;
@property (nonatomic,strong) LDMFlurryAnalyticsTracker *flurryAnalyticsTracker;

- (void)fillEventPool;
+ (void)fillEventPool;

@end
