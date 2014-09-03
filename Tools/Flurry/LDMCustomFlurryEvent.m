//
//  LDMFlurryEvent.m
//  LDMAnalyticsTools
//
//  Created by Lobanov Dmitry on 15.02.13.
//
//

#import "LDMCustomFlurryEvent.h"
#import "Flurry.h"

@implementation LDMCustomFlurryEvent

#pragma mark - Initialization

+ (CustomFlurryEvent *)event{
    return [[CustomFlurryEvent alloc] init];
}

+ (CustomFlurryEvent *)eventWithName:(NSString *)eventName
                          parameters:(NSDictionary *)eventParameters
                               timed:(BOOL)isTimed{
    CustomFlurryEvent *event = [CustomFlurryEvent event];
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
    [Flurry logEvent:self.eventName withParameters:self.eventParameters timed:self.isTimed];
//    DLog(@"flurry log event with name :%@  parameters:%@ timed: %hhd ", self.eventName, self.eventParameters, self.isTimed);
}

/*example of custom handler*/
- (void)socialEventNotificationHandler:(NSNotification *)notification{
    if ([notification.object isKindOfClass:[NSString class]]) {
        self.eventParameters = @{@"Social name": notification.object};
    }
    [self defaultNotificationHandler:notification];
}

@end
