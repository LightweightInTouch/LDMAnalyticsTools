//
//  LDMCustomGAIEvent.m
//  LDMAnalyticsTools
//
//  Created by Lobanov Dmitry on 18.02.13.
//
//

#import "LDMGAIEvent.h"
#import "LDMGAITracker.h"
@interface LDMGAIEvent ()

@property (nonatomic,strong) NSString *eventActionPrefix;

@end

@implementation LDMGAIEvent

#pragma mark - Initialization

+ (instancetype)createEvent{
    return [[self alloc] init];
}

+ (instancetype)createEventWithCategory:(NSString *)eventCategory
                               action:(NSString *)eventAction
                                label:(NSString *)eventLabel
                                value:(NSNumber *)eventValue{
    LDMGAIEvent *event = [self createEvent];
    event.eventCategory = eventCategory;
    event.eventAction   = eventAction;
    event.eventLabel    = eventLabel;
    event.eventValueIs64bit = eventValue;
    return event;
}

#pragma mark - Subscribe

- (void)subscribeOnNotificationWithName:(NSString *)notificationName{
    [self subscribeOnNotificationWithName:notificationName
                                  notificationHandler:@selector(defaultNotificationHandler:)];
}

- (void)subscribeOnNotificationWithName:(NSString*)notificationName
                    notificationHandler:(SEL)handler{
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:handler
                                                 name:notificationName
                                               object:nil];
}

#pragma mark - Notification handlers

/*default handler*/
- (void)defaultNotificationHandler:(NSNotification *)notification{
    [self.tracker sendEvent:self];
//    DLog(@"GAI send event with category: %@ action: %@ label:%@ value:%@", self.eventCategory, self.eventAction, self.eventLabel, self.eventValueIs64bit);
}

- (void)socialEventNotificationHandler:(NSNotification *)notification{
    if ([notification.object isKindOfClass:[NSString class]]) {
        if (!self.eventActionPrefix) {
            self.eventActionPrefix = self.eventAction; //"Shared to" for example
        }
        self.eventAction = [[self.eventActionPrefix stringByAppendingString:@" "] stringByAppendingString:notification.object];
    }
    [self defaultNotificationHandler:notification];
}


@end
