//
//  LDMFlurryEventFactory.h
//  LDMAnalyticsTools
//
//  Created by Lobanov Dmitry on 19.02.13.
//
//

#import <Foundation/Foundation.h>

@interface LDMFlurryEventFactory : NSObject

+ (NSArray *)allEvents;
+ (void)setAllEvents:(NSArray*)events;

@end
