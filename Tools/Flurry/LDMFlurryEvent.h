//
//  LDMFlurryEvent.h
//  LDMAnalyticsTools
//
//  Created by Lobanov Dmitry on 15.02.13.
//
//

#import <Foundation/Foundation.h>

@interface LDMFlurryEvent : NSObject

#pragma mark - Properties
@property (nonatomic, strong) NSString *eventName;
@property (nonatomic, strong) NSDictionary *eventParameters;
@property (nonatomic) BOOL isTimed;

#pragma mark - Initialization
+ (instancetype)createEvent;
+ (instancetype)createEventWithName:(NSString *)eventName
                   parameters:(NSDictionary *)eventParameters
                        timed:(BOOL)isTimed;


#pragma mark - Subscribe
- (void)subscribeOnNotificationWithName:(NSString *)notificationName;

- (void)subscribeOnNotificationWithName:(NSString *)notificationName
                    notificationHandler:(SEL)handler;

#pragma mark - Notification handlers
- (void)defaultNotificationHandler:(NSNotification *)notification;
- (void)socialEventNotificationHandler:(NSNotification *)notification;

@end
