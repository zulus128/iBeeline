//
//  Common.m
//  iBeeline
//
//  Created by Zul on 7/12/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "Common.h"
#import "Zone.h"

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
        NSString* tars = [tarifs stringByReplacingOccurrencesOfString:@"\r" withString:@"          "];
//        NSString* tars = [tarifs stringByReplacingOccurrencesOfString:@"\r" withString:@" "];
//        NSLog(@"%@", tars);
        tars = [tars stringByReplacingOccurrencesOfString:@"\n" withString:@"          "];
//        tars = [tars stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
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
    
    NSString *myHTML = [NSString stringWithFormat:@"<html> \n"
                        "<head> \n"
                        "<style type=\"text/css\"> \n"
                        "body {font-family: \"%@\"; font-size: %@;}\n"
                        "</style> \n"
                        "</head> \n"
                        "<body>%@</body> \n"
                        "</html>", @"DSOfficinaSerif-Book", [NSNumber numberWithInt:16], [[self.faqjson objectAtIndex:num] objectForKey:@"text"]];
    return myHTML;

}

- (NSString*) getSelectedFAQtext {
    
    NSString *myHTML = [NSString stringWithFormat:@"<html> \n"
                        "<head> \n"
                        "<style type=\"text/css\"> \n"
                        "body {font-family: \"%@\"; font-size: %@;}\n"
                        "</style> \n"
                        "</head> \n"
                        "<body>%@</body> \n"
                        "</html>", @"DSOfficinaSerif-Book", [NSNumber numberWithInt:16], [[self.faqjson objectAtIndex:self.selectedFAQ] objectForKey:@"text"]];
    return myHTML;
    
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

- (BOOL) isBeeZone {
    
    NSArray* ar = [self.tarifjson objectForKey:TARIF_KEY];
    NSNumber* t1 = [[ar objectAtIndex:self.selectedTarif] objectForKey:@"bt"];

    return (t1.intValue > 0);
}

- (Zone*) getBeelineZoneSelected {
    
    return [self getZoneSelected:YES];
}

- (Zone*) getOtherZoneSelected {
    
    return [self getZoneSelected:NO];
}

- (NSString*) getAltNameSelected:(BOOL)z {

    NSArray* ar = [self.tarifjson objectForKey:TARIF_KEY];
    NSString* t = z?[[ar objectAtIndex:self.selectedTarif] objectForKey:@"bo"]:@"";
    return t;

}

- (Zone*) getZoneSelected:(BOOL)z {

    if(![self isBeeZone])
        z = NO;
    
    NSArray* ar = [self.tarifjson objectForKey:TARIF_KEY];
    NSNumber* t = [[ar objectAtIndex:self.selectedTarif] objectForKey:z?@"bt":@"t"];

    Zone* zon = [[Zone alloc] init];
    NSArray* dar = [self.tarifjson objectForKey:ZONE_KEY];

    for(id ob in dar) {
//        NSLog(@"id = %@", [ob objectForKey:@"id"]);
    
        if(((NSNumber*)[ob objectForKey:@"id"]).intValue == t.intValue) {
            
            zon.input = ((NSNumber*)[ob objectForKey:@"input"]).floatValue;
            zon.output = ((NSNumber*)[ob objectForKey:@"out"]).floatValue;
            zon.loc = ((NSNumber*)[ob objectForKey:@"loc"]).floatValue;
            zon.okg = ((NSNumber*)[ob objectForKey:@"okg"]).floatValue;
            zon.gprs = ((NSNumber*)[ob objectForKey:@"gprs"]).floatValue;
            zon.sms = ((NSNumber*)[ob objectForKey:@"sms"]).floatValue;


        }
    }
    
    NSArray* at = [[ar objectAtIndex:self.selectedTarif] objectForKey:z?@"bs":@"s"];
    zon.services = at;
    
    return zon;

}

- (NSString*) getServiceName:(int)num {
    
    NSArray* ar = [self.tarifjson objectForKey:SERVICE_KEY];
    
    for(id ob in ar)
        if(((NSNumber*)[ob objectForKey:@"id"]).intValue == num)
            return [ob objectForKey:NSLocalizedString(@"lang", nil)];
    
    return @"...";
    
}

- (NSString*) getSelectedServiceName {
    
    NSArray* ar = [self.tarifjson objectForKey:SERVICE_KEY];
    
    for(id ob in ar)
        if(((NSNumber*)[ob objectForKey:@"id"]).intValue == self.selectedService)
            return [ob objectForKey:NSLocalizedString(@"lang", nil)];
    
    return @"...";
    
}

- (NSString*) getSelectedServiceText {
    
    NSString* res = @"...";
    NSArray* ar = [self.tarifjson objectForKey:SERVICE_KEY];
    
    for(id ob in ar)
        if(((NSNumber*)[ob objectForKey:@"id"]).intValue == self.selectedService) {
            
            res = [ob objectForKey:NSLocalizedString(@"tlang", nil)];
            break;
        }
    
    res = [res stringByReplacingOccurrencesOfString:@"          " withString:@"<br/>"];

    NSString *myHTML = [NSString stringWithFormat:@"<html> \n"
                                   "<head> \n"
                                   "<style type=\"text/css\"> \n"
                                   "body {font-family: \"%@\"; font-size: %@;}\n"
                                   "</style> \n"
                                   "</head> \n"
                                   "<body>%@</body> \n"
                                   "</html>", @"DSOfficinaSerif-Book", [NSNumber numberWithInt:16], res];
    return myHTML;

}

- (void) setSelectedTarifNum:(NSString*)s {
    
    NSArray* ar = [self.tarifjson objectForKey:TARIF_KEY];
//    NSLog(@"%@", ar);
    for(int i = 0; i < ar.count; i++)
        if([[[ar objectAtIndex:i] objectForKey:NSLocalizedString(@"lang", nil)]isEqual:s]){
            self.selectedTarif = i;
            NSLog(@"%d", i);
        }

}


@end
