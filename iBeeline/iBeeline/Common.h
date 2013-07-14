//
//  Common.h
//  iBeeline
//
//  Created by Zul on 7/12/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

@interface Common : NSObject {
    
}

+ (Common*) instance;

- (int) getFAQcnt;
- (NSString*) getFAQname:(int)num;
- (NSString*) getFAQtext:(int)num;
- (NSString*) getSelectedFAQtext;

@property (nonatomic, retain) NSArray* faqjson;
@property (assign, readwrite) int selectedFAQ;

@end
