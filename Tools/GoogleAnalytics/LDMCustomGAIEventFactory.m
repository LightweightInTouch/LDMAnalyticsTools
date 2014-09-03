//
//  LDMCustomGAIEvent.m
//  LDMAnalyticsTools
//
//  Created by Lobanov Dmitry on 21.03.13.
//
//

#import "LDMCustomGAIEventFactory.h"
#import "LDMCustomGAIEvent.h"

@implementation LDMCustomGAIEventFactory

#pragma mark - Events

/*
examples:
+ (LDMCustomGAIEvent *)SessionOpenedEvent{
    LDMCustomGAIEvent *sessionOpenedEvent = [LDMCustomGAIEvent eventWithCategory:@"Session"
                                                                    action:@"Opened"
                                                                     label:@"General"
                                                                     value:@YES];
    [sessionOpenedEvent subscribeOnNotificationWithName:DID_APPLICATION_BECOME_ACTIVE];
    return sessionOpenedEvent;
}

+ (LDMCustomGAIEvent *)SocialLoginEvent{
    LDMCustomGAIEvent *socialLoginEvent = [LDMCustomGAIEvent eventWithCategory:@"User social login"
                                                                action:@"Login to"
                                                                 label:@"Social"
                                                                 value:@YES];
    [socialLoginEvent subscribeOnNotificationWithName:SOCIAL_LOGIN notificationHandler:@selector(socialEventNotificationHandler:)];
    return socialLoginEvent;
}
*/

+ (NSArray *)allEvents{
    return @[[self SessionOpenedEvent],
             [self SocialLoginEvent]
             ];
}

@end
