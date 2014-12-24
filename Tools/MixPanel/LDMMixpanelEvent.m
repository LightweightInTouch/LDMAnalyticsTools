//
//  LDMFlurryEvent.m
//  LDMAnalyticsTools
//
//  Created by Lobanov Dmitry on 15.02.13.
//
//

#import "LDMMixpanelEvent.h"

@implementation LDMMixpanelEvent

#pragma mark - Initialization

+ (instancetype)createEvent{
    return [[self alloc] init];
}

+ (instancetype)createEventWithName:(NSString *)eventName
                         parameters:(NSDictionary *)eventParameters
                              timed:(BOOL)isTimed{
    LDMMixpanelEvent *event = [self createEvent];
    event.eventName = eventName;
    event.eventParameters = eventParameters;
    event.isTimed = isTimed;
    return event;
}

#pragma mark - Subscribe

- (void)subscribeOnNotificationWithName:(NSString *)notificationName{
    [self subscribeOnNotificationWithName:notificationName notificationHandler:@selector(defaultNotificationHandler:)];
}

- (void)subscribeOnNotificationWithName:(NSString *)notificationName
                    notificationHandler:(SEL)handler{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:handler name:notificationName object:nil];
}

#pragma mark - Notification handlers

/*default handler*/
- (void)defaultNotificationHandler:(NSNotification *)notification{
    [[Mixpanel sharedInstance] track:self.eventName properties:self.eventParameters];
//    [Flurry logEvent:self.eventName withParameters:self.eventParameters timed:self.isTimed];
//    if (logEnabled)
//    {
    NSLog(@"mixpanel log event with name :%@  parameters:%@ timed: %@ ", self.eventName, self.eventParameters, self.isTimed ? @"YES" : @"NO");
//    }
}

/*example of custom handler*/
- (void)socialEventNotificationHandler:(NSNotification *)notification{
    if ([notification.object isKindOfClass:[NSString class]]) {
        self.eventParameters = @{@"Social name": notification.object};
    }
    [self defaultNotificationHandler:notification];
}

@end
