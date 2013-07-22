//
//  Common.h
//  iBeeline
//
//  Created by Zul on 7/12/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#define TARIF_KEY @"c"
#define ZONE_KEY @"t"
#define SERVICE_KEY @"s"

@class Zone;

@interface Common : NSObject {
    
}

+ (Common*) instance;

- (int) getFAQcnt;
- (NSString*) getFAQname:(int)num;
- (NSString*) getFAQtext:(int)num;
- (NSString*) getSelectedFAQtext;

- (int) getTarifCnt;
- (NSString*) getTarifName:(int)num;
- (NSString*) getSelectedTarifName;
- (NSString*) getTarifText:(int)num;
- (NSString*) getSelectedTarifText;

- (Zone*) getBeelineZoneSelected;
- (Zone*) getOtherZoneSelected;

- (BOOL) isBeeZone;

- (NSString*) getServiceName:(int)num;

@property (nonatomic, retain) NSArray* faqjson;
@property (nonatomic, retain) NSDictionary* tarifjson;
@property (assign, readwrite) int selectedFAQ;
@property (assign, readwrite) int selectedTarif;

@end
