//
//  Common.m
//  iBeeline
//
//  Created by Zul on 7/12/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "Common.h"

@implementation Common

+ (Common*) instance  {
	
	static Common* instance;
	
	@synchronized(self) {
		
		if(!instance) {
			
			instance = [[Common alloc] init];
            
		}
	}
	return instance;
}

- (id) init {
	
	self = [super init];
	if(self !=nil) {
        
        
        NSArray* sp = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString* docpath = [sp objectAtIndex: 0];
        NSString* filePath = [docpath stringByAppendingPathComponent:@"faq.json"];
        BOOL fe = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
        if(!fe) {
            
            NSString *appFile = [[NSBundle mainBundle] pathForResource:@"faq" ofType:@"json"];
            NSFileManager *fileManager = [NSFileManager defaultManager];
            NSError *error;
            [fileManager copyItemAtPath:appFile toPath:filePath error:&error];
            
        }

        
        
        
        NSData* faq = [NSData dataWithContentsOfFile:filePath];
        NSError* error;
        self.faqjson = [NSJSONSerialization
                              JSONObjectWithData:faq
//                              options:kNilOptions
                                options:NSDataReadingUncached
                              error:&error];
        
        if (!self.faqjson) {
            NSLog(@"Error parsing JSON: %@", error);
        } else {

            NSLog(@"Parsing FAQ: OK! %@", self.faqjson);
            
        }
	}
	return self;
}

- (int) getFAQcnt {
    
    return self.faqjson.count;
}

- (NSString*) getFAQname:(int)num {

//    NSArray* vals = [self.faqjson allValues];
    return [[self.faqjson objectAtIndex:num] objectForKey:@"title"];
}

- (NSString*) getFAQtext:(int)num {
    
//    NSArray* vals = [self.faqjson allValues];
    return [[self.faqjson objectAtIndex:num] objectForKey:@"text"];
}

- (NSString*) getSelectedFAQtext {
    
    return [[self.faqjson objectAtIndex:self.selectedFAQ] objectForKey:@"text"];
}

@end
