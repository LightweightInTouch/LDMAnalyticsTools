//
//  LDMBaseEventFactory.h
//  HowToUseAnalyticsTools
//
//  Created by Lobanov Dmitry on 24.12.14.
//  Copyright (c) 2014 example. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDMBaseEventFactory : NSObject

+(instancetype)createFactory;
+(NSArray*)allEvents;

@property (nonatomic,strong)NSArray* allEvents;

@end
