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

@property (nonatomic,strong) LDMGAITracker *googleAnalyticsTracker;
@property (nonatomic,strong) LDMFlurryAnalyticsTracker *flurryAnalyticsTracker;

- (void)fillEventPool;
+ (void)fillEventPool;

@end
