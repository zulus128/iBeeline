//
//  Zone.h
//  iBeeline
//
//  Created by Zul on 7/18/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Zone : NSObject

@property (assign, readwrite) float input;
@property (assign, readwrite) float output;
@property (assign, readwrite) float loc;
@property (assign, readwrite) float okg;
@property (assign, readwrite) float gprs;
@property (assign, readwrite) float sms;

@property (nonatomic, retain) NSArray* services;

@end
