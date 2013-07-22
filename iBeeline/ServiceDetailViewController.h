//
//  ServiceDetailViewController.h
//  iBeeline
//
//  Created by Zul on 7/22/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceDetailViewController : UIViewController

@property(nonatomic, retain) IBOutlet UIWebView* wv;
@property(nonatomic, retain) IBOutlet NSLayoutConstraint* wv_height;

@property(nonatomic, retain) IBOutlet UIScrollView* sv;

@property(nonatomic, retain) IBOutlet UIButton* but1;
@property(nonatomic, retain) IBOutlet UIButton* but2;

@end
