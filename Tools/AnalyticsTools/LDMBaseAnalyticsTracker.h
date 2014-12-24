//
//  LDMBaseAnalyticsTracker.h
//  HowToUseAnalyticsTools
//
//  Created by Lobanov Dmitry on 24.12.14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LDMBaseEventFactory.h"

@interface LDMBaseAnalyticsTracker : NSObject

+ (instancetype) createTrackerWithAppID:(NSString*)appID;

@property(nonatomic,strong)NSArray* eventPool;
@property(nonatomic,strong)LDMBaseEventFactory* eventFactory;

- (void)fillEventPool;

@end
