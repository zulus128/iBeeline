//
//  NewsDetailViewController.h
//  iBeeline
//
//  Created by Zul on 7/31/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsDetailViewController : UIViewController {
    
    UILabel* label;

}
@property(nonatomic, retain) IBOutlet UIWebView* wv;
@property(nonatomic, retain) IBOutlet UILabel* lab;

@end
