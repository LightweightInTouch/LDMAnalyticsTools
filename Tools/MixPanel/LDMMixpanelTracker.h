//
//  LDMMixpanelTracker.h
//  HowToUseAnalyticsTools
//
//  Created by Lobanov Dmitry on 24.12.14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import "LDMBaseAnalyticsTracker.h"
#import "Mixpanel.h"
#import "LDMMixpanelEventFactory.h"

@interface LDMMixpanelTracker : LDMBaseAnalyticsTracker

@property (nonatomic,strong) Mixpanel* tracker;

- (void)trackEvent:(LDMMixpanelEvent*)event;

@end
