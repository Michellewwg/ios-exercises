//
//  ViewController.h
//  Alcolator
//
//  Created by Michelle Rutherford on 4/5/15.
//  Copyright (c) 2015 Michelle Rutherford. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) UITextField *beerPercentTextField;
@property (weak, nonatomic) UISlider *beerCountSlider;
@property (weak, nonatomic) UILabel *resultLabel;

- (void)buttonPressed:(UIButton *)sender;

@end

