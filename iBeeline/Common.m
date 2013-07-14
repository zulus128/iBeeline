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

        NSString* tarifPath = [docpath stringByAppendingPathComponent:@"tarifs.json"];
        BOOL fe = [[NSFileManager defaultManager] fileExistsAtPath:tarifPath];
        if(!fe) {
            
            NSString *appFile = [[NSBundle mainBundle] pathForResource:@"tarifs" ofType:@"json"];
            NSFileManager *fileManager = [NSFileManager defaultManager];
            NSError *error;
            [fileManager copyItemAtPath:appFile toPath:tarifPath error:&error];
        }
        
//        NSString* tarifs = [NSString stringWithContentsOfFile:tarifPath];
        NSString *tarifs= [NSString stringWithContentsOfFile:tarifPath encoding:NSUTF8StringEncoding error:nil];
//        NSLog(@"tarifs = %@", tarifs);
        NSString* tars = [tarifs stringByReplacingOccurrencesOfString:@"\r" withString:@" "];
        tars = [tars stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
//        NSLog(@"tars = %@", tars);
        NSData* tardata = [tars dataUsingEncoding:NSUTF8StringEncoding];
        NSError* error;
        self.tarifjson = [NSJSONSerialization JSONObjectWithData:tardata options:NSDataReadingUncached error:&error];
        
        if (!self.tarifjson) {

            NSLog(@"Error parsing FAQ Tarifs: %@", error);
            
        } else {
            
            NSLog(@"Parsing Tarifs: OK!");
//            NSLog(@"Parsing Tarifs: OK! %@", [self.tarifjson objectForKey:TARIF_KEY]);
            
        }

        
        NSString* faqPath = [docpath stringByAppendingPathComponent:@"faq.json"];
        fe = [[NSFileManager defaultManager] fileExistsAtPath:faqPath];
        if(!fe) {
            
            NSString *appFile = [[NSBundle mainBundle] pathForResource:@"faq" ofType:@"json"];
            NSFileManager *fileManager = [NSFileManager defaultManager];
            NSError *error;
            [fileManager copyItemAtPath:appFile toPath:faqPath error:&error];
        }
        
        NSData* faq = [NSData dataWithContentsOfFile:faqPath];
        self.faqjson = [NSJSONSerialization JSONObjectWithData:faq options:NSDataReadingUncached error:&error];
        
        if (!self.faqjson) {
            NSLog(@"Error parsing FAQ JSON: %@", error);
        } else {

//            NSLog(@"Parsing FAQ: OK! %@", self.faqjson);
            NSLog(@"Parsing FAQ: OK!");
            
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

- (int) getTarifCnt {
    
    return ((NSDictionary*)[self.tarifjson objectForKey:TARIF_KEY]).count;
}

- (NSString*) getTarifName:(int)num {

    NSArray* ar = [self.tarifjson objectForKey:TARIF_KEY];
    return [[ar objectAtIndex:num] objectForKey:NSLocalizedString(@"lang", nil)];

}

- (NSString*) getSelectedTarifName {

    NSArray* ar = [self.tarifjson objectForKey:TARIF_KEY];
    return [[ar objectAtIndex:self.selectedTarif] objectForKey:NSLocalizedString(@"lang", nil)];

}

//- (NSString*) getTarifText:(int)num;
//- (NSString*) getSelectedTarifText;

@end