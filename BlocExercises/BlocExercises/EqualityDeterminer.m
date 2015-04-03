//
//  EqualityDeterminer.m
//  BlocExercises
//
//  Created by Aaron Brager on 6/10/14.
//
//

#import "EqualityDeterminer.h"

@implementation EqualityDeterminer

- (BOOL) string:(NSString *)string1 isTheSameAsString:(NSString *)string2 {
    /* WORK HERE */
    BOOL stringTest =  [string1 isEqualToString:string2];
   
    return stringTest;
  //  return (string1 == string2);
}

- (BOOL) number:(NSNumber *)number1 isTheSameAsNumber:(NSNumber *)number2 {
    /* WORK HERE */
    BOOL numberTest = [number1 isEqualToNumber:number2];
   
    return numberTest;
   // return (number1 == number2);
}

- (BOOL) integer:(NSInteger)integer1 isGreaterThan:(NSInteger)integer2 {
    BOOL gttest = integer1  > integer2;
    return gttest;
    
}

@end
