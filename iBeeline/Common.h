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
#define TIMESTAMP_KEY @"d"
#define BUTTON_FONT 16

#define TARIF_URL @"http://194.176.111.95/BeeLineKGMobile/update"
#define NEWS_URL @"http://194.176.111.95/BeeLineKGMobile/getOffers"

#define RGBCOLOR(r, g, b) [UIColor colorWithRed:r/225.0f green:g/225.0f blue:b/225.0f alpha:1]

@class Zone;

@interface Common : NSObject {
    
}

+ (Common*) instance;

- (int) getFAQcnt;
- (NSString*) getFAQname:(int)num;
- (NSString*) getFAQtext:(int)num;
- (NSString*) getSelectedFAQtext;
- (NSString*) getSelectedFAQname;

- (int) getTarifCnt;
- (NSString*) getTarifName:(int)num;
- (NSString*) getSelectedTarifName;
- (NSString*) getTarifText:(int)num;
- (NSString*) getSelectedTarifText;

- (int) getNewsCnt;
- (NSString*) getNewsTime:(int)num;
- (NSString*) getNewsTitle:(int)num;
- (NSString*) getNewsText:(int)num;
- (NSString*) getNewsTextTrimmed:(int)num;
- (NSString*) getSelectedNewsTime;
- (NSString*) getSelectedNewsTitle;
- (NSString*) getSelectedNewsText;

- (void) setSelectedTarifNum:(NSString*)s;

- (Zone*) getBeelineZoneSelected;
- (Zone*) getOtherZoneSelected;

- (BOOL) isBeeZone;

- (NSString*) getServiceName:(int)num;
- (NSString*) getSelectedServiceName;
- (NSString*) getSelectedServiceText;

- (NSString*) getAltNameSelected:(BOOL)z;

- (NSString*) getStringForKey:(NSString*)key;

- (void) loadData;

@property (nonatomic, retain) NSArray* faqjson;
@property (nonatomic, retain) NSArray* faqjsonkg;
@property (nonatomic, retain) NSArray* news;
@property (nonatomic, retain) NSDictionary* tarifjson;
@property (assign, readwrite) int selectedFAQ;
@property (assign, readwrite) int selectedTarif;
@property (assign, readwrite) int selectedService;
@property (assign, readwrite) int selectedNews;
@property (assign, readwrite) double timestamp;
@property (nonatomic, retain) NSBundle* languageBundle;

@end
