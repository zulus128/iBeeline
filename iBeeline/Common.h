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
#define BUTTON_FONT 16

#define RGBCOLOR(r, g, b) [UIColor colorWithRed:r/225.0f green:g/225.0f blue:b/225.0f alpha:1]

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

- (void) setSelectedTarifNum:(NSString*)s;

- (Zone*) getBeelineZoneSelected;
- (Zone*) getOtherZoneSelected;

- (BOOL) isBeeZone;

- (NSString*) getServiceName:(int)num;
- (NSString*) getSelectedServiceName;
- (NSString*) getSelectedServiceText;

- (NSString*) getAltNameSelected:(BOOL)z;

- (NSString*) getStringForKey:(NSString*)key;

@property (nonatomic, retain) NSArray* faqjson;
@property (nonatomic, retain) NSDictionary* tarifjson;
@property (assign, readwrite) int selectedFAQ;
@property (assign, readwrite) int selectedTarif;
@property (assign, readwrite) int selectedService;
@property (nonatomic, retain) NSBundle* languageBundle;

@end
