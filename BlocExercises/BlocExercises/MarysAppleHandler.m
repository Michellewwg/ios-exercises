//
//  MarysAppleHandler.m
//  BlocExercises
//
//  Created by Aaron on 6/8/14.
//
//

#import "MarysAppleHandler.h"

@implementation MarysAppleHandler

- (NSString *) itemMaryCanPurchaseForDollars:(NSInteger)dollars {
    NSString *itemToReturn;
    // ********************************************************
    // *  I would normally haveused a switch statement for this
    // * ******************************************************
    if (dollars == 4)
    {
        itemToReturn = @"get out of my store";
    } else if (dollars == 5)
    {
        itemToReturn = @"have some gum";
    } else if (dollars == 6)
    {
        itemToReturn = @"have an apple";
    } else if (dollars == 1000)
    {
        itemToReturn = @"have an Apple computer";
    } else if (dollars == 1000000000)
    {
        itemToReturn =  @"have The Big Apple";
    }
    /* WORK HERE */
    
    NSLog(@"For $%ld, Mary can: %@", (long)dollars, itemToReturn);
    return itemToReturn;
}

- (NSUInteger) dollarCostForAppleFlavoredVodka {
    /* WORK HERE */

    NSUInteger cost = 24;
    cost = self.getsDiscount ? cost *= .75 : 24;
//    if (self.getsDiscount) {
//        cost *= .75;
//    }
    
    return cost;
}

@end
