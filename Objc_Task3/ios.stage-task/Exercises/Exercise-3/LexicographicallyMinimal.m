#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {

    NSMutableString *resultString = [NSMutableString string];
    NSMutableString *mutableString1 = [string1 mutableCopy];
    NSMutableString *mutableString2 = [string2 mutableCopy];

    
    while (![mutableString1  isEqual: @""] && ![mutableString2  isEqual: @""]) {
        if ([mutableString1 characterAtIndex:0] < [mutableString2 characterAtIndex:0]) {
            [resultString appendString:[mutableString1 substringToIndex:1]];
            [mutableString1 deleteCharactersInRange:NSMakeRange(0, 1)];
            continue;
        } else if ([mutableString1 characterAtIndex:0] > [mutableString2 characterAtIndex:0]) {
            [resultString appendString:[mutableString2 substringToIndex:1]];
            [mutableString2 deleteCharactersInRange:NSMakeRange(0, 1)];
            continue;
        } else if ([mutableString1 characterAtIndex:0] == [mutableString2 characterAtIndex:0]) {
            if (mutableString1.length == 1) {
                [resultString appendString:[mutableString2 substringToIndex:1]];
                [mutableString2 deleteCharactersInRange:NSMakeRange(0, 1)];
                continue;
            }
            
            if (mutableString2.length == 1) {
                [resultString appendString:[mutableString1 substringToIndex:1]];
                [mutableString1 deleteCharactersInRange:NSMakeRange(0, 1)];
                continue;
            }
            
            if ([mutableString1 characterAtIndex:1] < [mutableString2 characterAtIndex:1]) {
                [resultString appendString:[mutableString1 substringToIndex:1]];
                [mutableString1 deleteCharactersInRange:NSMakeRange(0, 1)];
                continue;
            } else {
                [resultString appendString:[mutableString2 substringToIndex:1]];
                [mutableString2 deleteCharactersInRange:NSMakeRange(0, 1)];
                continue;
            }
        }
    }

    if ([mutableString1  isEqual: @""]) {
        while (![mutableString2  isEqual: @""]) {
            [resultString appendString:[mutableString2 substringToIndex:1]];
            [mutableString2 deleteCharactersInRange:NSMakeRange(0, 1)];
        }
    }
    
    if ([mutableString2  isEqual: @""]) {
        while (![mutableString1  isEqual: @""]) {
            [resultString appendString:[mutableString1 substringToIndex:1]];
            [mutableString1 deleteCharactersInRange:NSMakeRange(0, 1)];
        }
    }
    
    if ([mutableString1  isEqual: @""] && [mutableString1  isEqual: @""]) {
        NSLog(@"Result string: %@", resultString);
        return resultString;
    }
    return resultString;
    
    return nil;
}

@end
