//
//  StarTrekArrays.m
//  BlocExercises
//
//  Created by Aaron on 6/10/14.
//
//

#import "StarTrekArrays.h"

@implementation StarTrekArrays

- (NSArray *) arrayOfStarTrekCharactersFromString:(NSString *)characterString {
    NSArray *charsArray = [characterString componentsSeparatedByString:@";"];
    return charsArray;
}

- (NSString *) stringOfStarTrekCharactersFromArray:(NSArray *)characterArray {
    NSString *stringOfChars = [characterArray componentsJoinedByString:@";"];
    
    return stringOfChars;
}

- (NSArray *) alphabeticallySortedStarTrekCharactersFromArray:(NSArray *)characterArray {
    
    NSMutableArray *sArray = [characterArray mutableCopy];
    NSSortDescriptor *sortDesc =[[NSSortDescriptor alloc] initWithKey:nil ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
    
    [sArray sortUsingDescriptors:@[sortDesc]];
    
    return [sArray copy];
}

- (BOOL) characterArrayContainsWorf:(NSArray *)characterArray {
    
    BOOL hasWorf = NO;
    for (NSString *name in characterArray)
    {
        if ([name  containsString:@"Worf"])
        {
            hasWorf = YES;
            break;
        }
    }
    
    
    return hasWorf;
}

@end
