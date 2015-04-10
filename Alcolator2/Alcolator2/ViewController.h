//
//  ViewController.h
//  Alcolator2
//
//  Created by Michelle Rutherford on 4/7/15.
//  Copyright (c) 2015 Michelle Rutherford. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *beerPercentTextField;
@property (weak, nonatomic) IBOutlet UISlider *beerCountSlider;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
- (void)buttonPressed:(UIButton *)sender;

@end

