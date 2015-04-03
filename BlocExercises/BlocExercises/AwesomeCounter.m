//
//  AwesomeCounter.m
//  BlocExercises
//
//  Created by Aaron on 6/10/14.
//
//

#import "AwesomeCounter.h"

@implementation AwesomeCounter

- (NSString *) stringWithNumbersBetweenNumber:(NSInteger)number andOtherNumber: (NSInteger)otherNumber {
    /* WORK HERE */
    
    NSInteger lowNumber=0;
    NSInteger highNumber = 9999;
    if (number <= otherNumber)
    {
        lowNumber = number;
        highNumber = otherNumber;
    } else {
        lowNumber = otherNumber;
        highNumber = number;
    }
    
    NSMutableString *results = [NSMutableString string];
    
    for (NSInteger num = lowNumber; num <= highNumber; num++)
    {
        NSString *strVal  = [@(num) stringValue];
        [results appendString:strVal];
    }
    NSString *rtnValue = [results copy];
    return rtnValue;
}

@end
