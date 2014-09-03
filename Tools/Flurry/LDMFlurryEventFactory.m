//
//  LDMFlurryEventFactory.m
//  LDMAnalyticsTools
//
//  Created by Lobanov Dmitry on 19.02.13.
//
//

#import "LDMFlurryEventFactory.h"
#import "LDMCustomFlurryEvent.h"

@implementation FlurryEventFactory

#pragma mark - Events

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
+ (NSArray *)allEvents{
    
    return @[[self SessionOpenedEvent],
             [self SocialLoginEvent]             
             ];
}
@end
