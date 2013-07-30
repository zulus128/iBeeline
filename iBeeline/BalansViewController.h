//
//  BalansViewController.h
//  iBeeline
//
//  Created by Zul on 7/30/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMessageComposeViewController.h>

@interface BalansViewController : UIViewController <MFMessageComposeViewControllerDelegate> {
    
    UILabel* label;
}

@property(nonatomic, retain) IBOutlet UITextView* tv1;
@property(nonatomic, retain) IBOutlet UITextView* tv2;
@property(nonatomic, retain) IBOutlet UITextView* tv3;

@property(nonatomic, retain) IBOutlet UIButton* bu1;
@property(nonatomic, retain) IBOutlet UIButton* bu2;

@end
