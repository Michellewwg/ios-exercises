//
//  StarTrekDictionaries.m
//  BlocExercises
//
//  Created by Aaron on 6/10/14.
//
//

#import "StarTrekDictionaries.h"

@implementation StarTrekDictionaries

- (NSString *)favoriteDrinkForStarTrekCharacterDictionary:(NSDictionary *)characterDictionary {
    
    NSString *drink = [characterDictionary objectForKey:@"favorite drink"];
    
    
    return drink;
}

- (NSArray *)arrayOfFavoriteDrinksForStarTrekCharacters:(NSArray *)charactersArray {
    

    NSMutableArray *results = [[NSMutableArray alloc] init];
   
    for (NSDictionary *val in charactersArray)
    {
        
        [results addObject:[val objectForKey:@"favorite drink"]];
    }
    
    return [results copy];
}

- (NSDictionary *)dictionaryWithQuoteAddedToStarTrekCharacterDictionary:(NSDictionary *)characterDictionary {
    
    NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc] init];
    mutableDic = [characterDictionary mutableCopy];
    [mutableDic setValue:@"is the bestest" forKey:@"quote"];
    
    return [mutableDic copy];
}

@end
