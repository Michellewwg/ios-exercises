//
//  StuffRememberer.m
//  BlocExercises
//
//  Created by Aaron on 6/12/14.
//
//

#import "StuffRememberer.h"

@implementation StuffRememberer

- (void) rememberThisArrayForLater:(NSMutableArray *)arrayToRemember {
    self.rememberThisForLater =  arrayToRemember  ;
}

- (void) copyThisArrayForLater:(NSMutableArray *)arrayToCopy {
    self.theCopy = arrayToCopy ;
}

- (void) rememberThisFloatForLater:(CGFloat)floatToRemember {
    self.floatToRemember = floatToRemember ;
}

- (NSMutableArray *) arrayYouShouldRemember {
    
    return self.rememberThisForLater ;
}

- (NSMutableArray *) arrayYouShouldCopy {
    /* WORK HERE */
    return self.theCopy;
}

- (CGFloat) floatYouShouldRemember {
    /* WORK HERE */
    return self.floatToRemember;
}

@end