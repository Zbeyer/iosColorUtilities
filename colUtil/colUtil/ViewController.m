//
//  ViewController.m
//  colUtil
//
//  Created by Zack Beyer on 5/7/15.
//  Copyright (c) 2015 zbeyer. All rights reserved.
//

#import "ViewController.h"
#import "CUutilities.h"
@interface ViewController ()

@end

@implementation ViewController

@synthesize primaryColor = _primaryColor;
@synthesize secondaryColor = _secondaryColor;

- (void)setPrimaryColor:(UIColor *)primaryColor {
    _primaryColor = primaryColor;
    self.descriptionViewLeft.textColor = _primaryColor;
    self.descriptionViewRight.backgroundColor = _primaryColor;
}

- (void)setSecondaryColor:(UIColor *)secondaryColor {
    _secondaryColor = secondaryColor;
    
    self.descriptionViewRight.textColor = _secondaryColor;
    self.descriptionViewLeft.backgroundColor = _secondaryColor;
}

- (UIColor *) primaryColor {
    return _primaryColor;
}

- (UIColor *) secondaryColor {
    return _secondaryColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.scoreBG.backgroundColor = [CUutilities uiColorFromColorData:[CUutilities colorFromHexString:@"#EEEEEE"]];
    self.contrast.textColor = [CUutilities uiColorFromColorData:[CUutilities colorFromHexString:@"#333333"]];
    self.scoreBG.layer.cornerRadius = 32;
    
    
    self.descriptionViewRight.text = self.descriptionViewLeft.text = @"Luminocity \nColor Contrast\n According to the Web Content Accessibility Guidelines from December 2008: (section 1.4.3) \n \"The visual presentation of text and images of text has a contrast ratio of at least 4.5:1, except for the following: (Level AA),\" and goes on to exclude: Large-scale text, logos, and decoration unrelated to user experience. \n \n \"Contrast (Enhanced): The visual presentation of text and images of text has a contrast ratio of at least 7:1, except for the following: (Level AAA),\" and goes on to exclude: the formentioned.\n \n In a nutshell this means that, for web, contrast ratio between two \"relative luminance\" values must be 7:1 (or greater) to recieve a AAA ranking. \n \nA AA ranking is earned by a contrast ratio of 4.5:1 (or greater).\n";
    
}

- (IBAction)onCalc:(id)sender {

    float l1 = [CUutilities luminsFromHexString:self.colorEntry1.text];
    
    float l2 = [CUutilities luminsFromHexString:self.colorEntry2.text];

    float contrastScore = [CUutilities luminocityScoreContrasting:l1 and:l2];
    
    self.contrast.text = [NSString stringWithFormat:@"%0.1f",contrastScore];
    
    self.primaryColor = [CUutilities uiColorFromColorData:
                         [CUutilities colorFromHexString:self.colorEntry1.text]];
    
    self.secondaryColor = [CUutilities uiColorFromColorData:
                            [CUutilities colorFromHexString:self.colorEntry2.text]];
}

@end
