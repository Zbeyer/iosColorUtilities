//
//  ViewController.h
//  colUtil
//
//  Created by Zack Beyer on 5/7/15.
//  Copyright (c) 2015 zbeyer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *colorEntry1;
@property (weak, nonatomic) IBOutlet UITextField *colorEntry2;
@property (weak, nonatomic) IBOutlet UILabel *contrast;

@property (weak, nonatomic) IBOutlet UIView *scoreBG;

@property (weak, nonatomic) IBOutlet UITextView *descriptionViewRight;
@property (weak, nonatomic) IBOutlet UITextView *descriptionViewLeft;

@property (nonatomic, strong) UIColor* primaryColor;

@property (nonatomic, strong) UIColor* secondaryColor;


- (IBAction)onCalc:(id)sender;


@end

