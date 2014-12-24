//
//  LDMFlurryAnalyticsTracker.h
//  LDMAnalyticsTools
//
//  Created by Lobanov Dmitry on 15.02.13.
//
//

#import <Foundation/Foundation.h>
#import "LDMBaseAnalyticsTracker.h"
#import "LDMFlurryEventFactory.h"

@interface LDMFlurryAnalyticsTracker : LDMBaseAnalyticsTracker
/*this class provides an object-oriented interface for Flurry SDK */
typedef enum{
    flurryGenderSigilMale,
    flurryGenderSigilFemale
}flurryGenderSigils;

#pragma mark - Properties
@property (nonatomic, assign) BOOL secureTransportEnabled;
@property (nonatomic, assign) BOOL reportsOnPauseEnabled;
@property (nonatomic, assign) BOOL reportsOnCloseEnabled;
/*location*/
//@property (nonatomic,strong) CLLocationManager* locationManager;
/*demographics*/
@property (nonatomic, strong) NSString *trackingUserID;
@property (nonatomic, strong) NSNumber *trackingAge;
@property (nonatomic, assign) flurryGenderSigils trackingGender;

#pragma mark - Initialization
+ (instancetype)createFlurryTrackerWithAppID:(NSString*)appID;
+ (instancetype)createFlurryTrackerWithSettingsEnabled:(BOOL)secureTransport
                                              andReportsOnPauseSending:(BOOL)reportOnPuase
                                              andReportsOnCloseSending:(BOOL)reportsOnClose
                                                             withAppID:(NSString *)appID;
//#pragma mark - Location settings
//-(void)activeLocationOption:(BOOL)locationIsEnabled;
//-(void)updateLastLocation;

@end
