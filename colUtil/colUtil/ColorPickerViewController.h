//
//  ColorPickerViewController.h
//  colUtil
//
//  Created by Zack Beyer on 5/13/15.
//  Copyright (c) 2015 zbeyer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CUutilities.h"
@interface ColorPickerViewController : UIViewController

- (IBAction)onDoneBttn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *doneBttn;


@property (weak, nonatomic) IBOutlet UIView *previewView;

@property (weak, nonatomic) IBOutlet UITextField *hexTextField;

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;

@property (weak, nonatomic) IBOutlet UILabel *redLabel;
@property (weak, nonatomic) IBOutlet UILabel *greenLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueLabel;


@end
