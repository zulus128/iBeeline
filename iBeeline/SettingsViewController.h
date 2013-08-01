//
//  SettingsViewController.h
//  iBeeline
//
//  Created by Zul on 7/30/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController {
    
    UILabel* label;
}

@property(nonatomic, retain) IBOutlet UILabel* langlab;
@property(nonatomic, retain) IBOutlet UIButton* langbut;
@property(nonatomic, retain) IBOutlet UIButton* aboutbut;
@property(nonatomic, retain) IBOutlet UIButton* loadbut;
@property(nonatomic, retain) IBOutlet UILabel* loadlab;



@end
