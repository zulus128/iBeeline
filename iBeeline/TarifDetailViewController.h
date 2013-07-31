//
//  TarifDetailViewController.h
//  iBeeline
//
//  Created by вадим on 7/14/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#define FONTSIZE 30
#define LFONTSIZE 16
#define SFONTSIZE 12

#import <UIKit/UIKit.h>

@interface TarifDetailViewController : UIViewController {
    
    BOOL nbb;
}

@property(nonatomic, retain) IBOutlet UIScrollView* sv;

@property(nonatomic, retain) IBOutlet UIButton* but1;
@property(nonatomic, retain) IBOutlet UIButton* but2;

-(IBAction) bt1:(id) sender;
-(IBAction) bt2:(id) sender;

@end
