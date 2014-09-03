//
//  LDMCustomGAITiming.h
//  LDMAnalyticsTools
//
//  Created by Lobanov Dmitry on 19.03.13.
//
//

#import <Foundation/Foundation.h>

@interface LDMCustomGAITiming : NSObject

@property (nonatomic,strong) NSString* timingCategory;
@property (nonatomic,strong) NSString* timingName;
@property (nonatomic,strong) NSString* timingLabel;
@property (nonatomic,strong) NSNumber* timeInterval;
@property (nonatomic,strong) NSString* notificationName;

#pragma mark - Initialization
+(instancetype)createTiming;
+(instancetype)createTimingWithCategory:(NSString *)category
                               withName:(NSString *)name
                              withLabel:(NSString *)label
                       withTimeInterval:(NSNumber *)value;

-(void)subscribeOnNotification:(NSString*)name;

@end
