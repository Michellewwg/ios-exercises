//
//  StringCheese.m
//  BlocExercises
//
//  Created by Aaron on 6/9/14.
//
//

#import "StringCheese.h"

@implementation StringCheese

- (NSString *) favoriteCheeseStringWithCheese:(NSString *)cheeseName {
    /* WORK HERE */
   // NSString *firstPart = @"My favorite cheese is ";
  //  NSString *fullSentence = [firstPart stringByAppendingString:cheeseName];
   // NSString *rtnString = [fullSentence stringByAppendingString:@"."];
    
    NSString *rtn2 = [NSString stringWithFormat:@"My favorite cheese is %@.",cheeseName];
    
    // fullSentence is "My favorite cheese is cheddar."
    return rtn2;
}

- (NSString *) cheeseNameWithoutCheeseSuffix:(NSString *)cheeseName {
    /* WORK HERE */
    NSString *rtnValue;
    
    NSRange rangeOfCheese = [cheeseName rangeOfString:@" cheese" options:NSCaseInsensitiveSearch];
    
    if ( rangeOfCheese.location != NSNotFound)
    {
        rtnValue =  [cheeseName stringByReplacingCharactersInRange:rangeOfCheese withString:@""];
    } else
    {
        rtnValue =   cheeseName;
    }
   
    return rtnValue;
    
}

- (NSString *) numberOfCheesesStringWithCheeseCount:(NSUInteger)cheeseCount {
    
    NSString *rtnValue;
    if (cheeseCount == 1) {
        rtnValue = [NSString stringWithFormat:@"%ld cheese",cheeseCount];
        /* WORK HERE, ASSUMING THERE IS 1 CHEESE */
        
    } else {
        /* WORK HERE, ASSUMING THERE ARE 2+ CHEESES */
        rtnValue = [NSString stringWithFormat:@"%ld cheeses",cheeseCount];
    }
    
    /*
     (You will learn more about if/else statements in the next checkpoint.)
     */
    
    return rtnValue;
}

@end
