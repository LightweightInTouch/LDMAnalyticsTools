//
//  LDMCustomGAIEvent.h
//  LDMAnalyticsTools
//
//  Created by Lobanov Dmitry on 18.02.13.
//
//

#import <Foundation/Foundation.h>

@class LDMGAITracker;

@interface LDMGAIEvent : NSObject

@property (nonatomic,strong) NSString *eventCategory;
@property (nonatomic,strong) NSString *eventAction;
@property (nonatomic,strong) NSString *eventLabel;
@property (nonatomic,strong) NSNumber *eventValueIs64bit;

@property (nonatomic, weak)  LDMGAITracker *tracker;

#pragma mark - Initialization
+ (instancetype)createEvent;
+ (instancetype)createEventWithCategory:(NSString *)eventCategory
                                 action:(NSString *)eventAction
                                  label:(NSString *)eventLabel
                                  value:(NSNumber *)eventValue;

#pragma mark - Subscribe
- (void)subscribeOnNotificationWithName:(NSString *)notificationName;

- (void)subscribeOnNotificationWithName:(NSString *)notificationName
                    notificationHandler:(SEL)handler;

#pragma mark - Notification handlers
- (void)defaultNotificationHandler:(NSNotification *)notification;
- (void)socialEventNotificationHandler:(NSNotification *)notification;

@end
