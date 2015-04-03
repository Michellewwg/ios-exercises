//
//  NumberHandler.m
//  BlocExercises
//
//  Created by Aaron on 6/11/14.
//
//

#import "NumberHandler.h"

@implementation NumberHandler

- (NSNumber *) numberThatIsTwiceAsBigAsNumber:(NSNumber *)number {
    
    
    
    return @([number intValue] * 2) ;
}

- (NSArray *) arrayOfNumbersBetweenNumber:(NSInteger)number andOtherNumber: (NSInteger)otherNumber {
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (NSInteger i = number ; i <= otherNumber; i++)
    {
        [array addObject:[NSNumber numberWithInteger:i]] ;
        
    }
    
    
    
    return [array copy];
}

- (NSInteger) lowestNumberInArray:(NSArray *)arrayOfNumbers {
    int cnt = 0;
    NSNumber *lowNumber = [[NSNumber alloc ] init];
   
    for (NSNumber *num in arrayOfNumbers) {
        if (cnt == 0)
        {
            lowNumber = num;
        }
   //     lowNumber = ([num] < [lowNumber]) ? num : lowNumber;
        if ([num integerValue] < [lowNumber integerValue])
        {
            lowNumber = num;
        }
        cnt++;
        
    }
    
    return [lowNumber integerValue];
}

@end
