//
//  WhiskeyViewController.m
//  Alcolator2
//
//  Created by Michelle Rutherford on 4/9/15.
//  Copyright (c) 2015 Michelle Rutherford. All rights reserved.
//

#import "WhiskeyViewController.h"

@interface WhiskeyViewController ()

@end

@implementation WhiskeyViewController

-(void)buttonPressed:(UIButton *)sender;
{
    [self.beerPercentTextField resignFirstResponder];
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12;  //assume they are 12oz beer bottles
    
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    float ouncesInOneWhiskeyGlass = 1;  // a 1oz shot
    float alcoholPercentageOfWhiskey = 0.4;  // 40% is average
    
    float ouncesOfAlcoholPerWhiskeyGlass = ouncesInOneWhiskeyGlass * alcoholPercentageOfWhiskey;
    float numberOfWhiskeyGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWhiskeyGlass;
    
    NSString *beerText;
    if (numberOfBeers == 1)
    {
        beerText = NSLocalizedString(@"beer",@"singular beer");
    } else
    {
         beerText = NSLocalizedString(@"beers",@"plural of beer");
    }
    
    NSString *whiskeyText;
    
    if (numberOfWhiskeyGlassesForEquivalentAlcoholAmount ==1)
    {
        whiskeyText =NSLocalizedString(@"shot",@"singular shot");
    }
    else
    {
        beerText = NSLocalizedString(@"shots",@"plural of shot");
    }
    self.navigationItem.title = [NSString stringWithFormat:NSLocalizedString(@"Whiskey (%d %@)",nil),numberOfBeers,beerText];
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (wit h %.2f%% alcohol) contains as much alcohol as %.1f %@ of whiskey.", nil),
                            numberOfBeers,
                            beerText,
                            [self.beerPercentTextField.text floatValue], numberOfWhiskeyGlassesForEquivalentAlcoholAmount, whiskeyText];
    

    self.resultLabel.text = resultText;
   
}

- (IBAction)sliderValueDidChange:(UISlider *)sender {
    NSLog(@"Slider value changed to %f", sender.value);
    int numberOfBeers = self.beerCountSlider.value;
    NSString *beerText;
    if (numberOfBeers == 1) {
        beerText =NSLocalizedString(@"shot", @"singular shot");
    } else {
        beerText = NSLocalizedString(@"shots", @"plural of shot");
    }
    
    
    
    self.navigationItem.title = [NSString stringWithFormat:NSLocalizedString(@"Whiskey (%d %@)",nil),numberOfBeers,beerText];
    
    [self.beerPercentTextField resignFirstResponder];
}



@end
