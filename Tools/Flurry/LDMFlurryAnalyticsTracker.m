//
//  LDMFlurryAnalyticsTracker.m
//  LDMAnalyticsTools
//
//  Created by Lobanov Dmitry on 15.02.13.
//
//

#import "LDMFlurryAnalyticsTracker.h"
#import "LDMCustomFlurryEvent.h"
#import "LDMFlurryEventFactory.h"
#import "Flurry.h"

@implementation LDMFlurryAnalyticsTracker

#pragma mark - Helpers
- (NSString *)stringFlurryGenderSigils:(flurryGenderSigils)sigil{
    NSString *stringResult = nil;
    switch (sigil) {
        case flurryGenderSigilMale:
            stringResult = @"m";
            break;
        case flurryGenderSigilFemale:
            stringResult = @"f";
            break;
        default:
            break;
    }
    return stringResult;
}

#pragma mark - Initialization
+ (instancetype)createLDMFlurryTrackerWithAppID:(NSString *)appID{

    LDMFlurryAnalyticsTracker *tracker = [[self alloc] init];
    [tracker defaultSessionSettings];
    [Flurry startSession:appID];
    [Flurry setCrashReportingEnabled:YES];
    [Flurry setDebugLogEnabled:NO];
    
    return  tracker;
}
+ (instancetype)createLDMFlurryTrackerWithSettingsEnabled:(BOOL)secureTransport
                                              andReportsOnPauseSending:(BOOL)reportOnPause
                                              andReportsOnCloseSending:(BOOL)reportsOnClose
                                                             withAppID:(NSString *)appID{
    LDMFlurryAnalyticsTracker *tracker = [[self alloc] init];
    tracker.secureTransportEnabled = secureTransport;
    tracker.reportsOnCloseEnabled = reportOnPause;
    tracker.reportsOnCloseEnabled = reportsOnClose;
    [Flurry startSession:appID];
    return tracker;
}

#pragma mark - set settings
- (void)defaultSessionSettings{
    self.secureTransportEnabled = YES;
    self.reportsOnCloseEnabled  = YES;
    self.reportsOnPauseEnabled  = YES;
}

- (void)setSecureTransportEnabled:(BOOL)secureTransportEnabled{
    _secureTransportEnabled = secureTransportEnabled;
    [Flurry setSecureTransportEnabled:secureTransportEnabled];
}

- (void)setReportsOnPauseEnabled:(BOOL)reportsOnPauseEnabled{
    _reportsOnPauseEnabled = reportsOnPauseEnabled;
    [Flurry setSessionReportsOnPauseEnabled:reportsOnPauseEnabled];
}

- (void)setReportsOnCloseEnabled:(BOOL)reportsOnCloseEnabled{
    _reportsOnCloseEnabled = reportsOnCloseEnabled;
    [Flurry setSessionReportsOnCloseEnabled:reportsOnCloseEnabled];
}

- (void)setTrackingUserID:(NSString *)trackingUserID{
    _trackingUserID = trackingUserID;
    [Flurry setUserID:trackingUserID];
}

- (void)setTrackingAge:(NSNumber *)trackingAge{
    _trackingAge = trackingAge;
    [Flurry setAge:[trackingAge intValue]];
}

- (void)setTrackingGender:(flurryGenderSigils)trackingGender{
    _trackingGender = trackingGender;
    [Flurry setGender:[self stringFlurryGenderSigils:trackingGender]];
}

//#pragma mark - Location settings
//-(void)activeLocationOption:(BOOL)locationIsEnabled{
//    if(!_locationManager&&locationIsEnabled){
//        _locationManager = [[CLLocationManager alloc] init];
//    }
//    [_locationManager startUpdatingLocation];
//}
//-(void)updateLastLocation{
//    [self activeLocationOption:YES];
//    CLLocation*location = _locationManager.location;
//    [Flurry setLatitude:location.coordinate.latitude
//              longitude:location.coordinate.longitude
//     horizontalAccuracy:location.horizontalAccuracy
//       verticalAccuracy:location.verticalAccuracy];
//}

#pragma mark - Custom Events Actions
- (void)placeEvent:(LDMCustomFlurryEvent *)event{
    if (event.eventName) {
        [Flurry logEvent:event.eventName
          withParameters:event.eventParameters
                   timed:event.isTimed];
    }
}   

- (void)fillEventPool{
    self.pullOfEvents = self.pullOfEvents ? [LDMFlurryEventFactory allEvents] : self.pullOfEvents;
}

@end
