//
//  LDMFlurryEventFactory.m
//  LDMAnalyticsTools
//
//  Created by Lobanov Dmitry on 19.02.13.
//
//

#import "LDMMixpanelEventFactory.h"
#import "LDMMixpanelEvent.h"

@implementation LDMMixPanelEventFactory
#pragma mark - Events

+ (LDMMixpanelEvent*)eventWithName:(NSString*)name
{
    LDMMixpanelEvent * event = [LDMMixpanelEvent createEventWithName:name parameters:nil timed:NO];
    [event subscribeOnNotificationWithName:name];
    return event;
}
/*
Examples:
+ (LDMCustomFlurryEvent *)SessionOpenedEvent{
    LDMCustomFlurryEvent *sessionOpenedEvent = [LDMCustomFlurryEvent eventWithName:@"Session opened"
                                                                  parameters:nil
                                                                     timed:NO];
    [sessionOpenedEvent subscribeOnNotificationWithName:DID_APPLICATION_BECOME_ACTIVE];
    return sessionOpenedEvent;
}

#pragma mark - Login/Logout Events

+ (LDMCustomFlurryEvent *)SocialLoginEvent{
    LDMCustomFlurryEvent *socialLoginEvent = [LDMCustomFlurryEvent eventWithName:@"Social login"
                                                                parameters:nil
                                                                   timed:NO];
    [socialLoginEvent subscribeOnNotificationWithName:SOCIAL_LOGIN notificationHandler:@selector(socialEventNotificationHandler:)];
    return socialLoginEvent;
}
*/
@end
