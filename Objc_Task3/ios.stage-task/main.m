#import <UIKit/UIKit.h>
#import "AppDelegate.h"



int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
//        My code:
        NSArray * tree = @[@3,@1,[NSNull null],@2,[NSNull null],[NSNull null],@4,[NSNull null],@5];


        //┌── 5
        //┌──4
        //│└── nil
        //3
        //│┌── 2
        //└──1
        //└── nil

        // test5Nodes19
//            levels = @[@[@3],@[@1,@4],@[@2,@5]];
        if (tree.count == 0) {
            NSLog(@"nil");
        }
        NSMutableArray *sortedArray = [NSMutableArray new];
        NSMutableArray *eachLevelArray = [NSMutableArray array];
        NSInteger currentLevel = 0;
        NSInteger nullCounter = 0;
        
        for (int i=0; i < tree.count; i++) {
            if (i == 6) {
                NSLog(@"%@, current level: %ld", sortedArray, (long)currentLevel);
                NSLog(@"i=6");
            }
            if (tree[i] == [NSNull null]) {
                nullCounter += 1;
            }
            if (nullCounter != 2) {
                
//                NSLog(@"Sorted array count: %lu", (unsigned long)sortedArray.count);
                if (sortedArray.count < i+ 1) {
                    [sortedArray addObject:[NSMutableArray new]];
                }
                
                [sortedArray[currentLevel] addObject:tree[i]];
                if (i == tree.count - 1) {
                    break;
                }
                if (tree[i] != [NSNull null]) {
                    
                    nullCounter = 0;
                    currentLevel += 1;
                    
                    [sortedArray addObject:[NSMutableArray new]];
                }
                
//                for (id element in sortedArray[currentLevel-1]) {
//                    if ([element isKindOfClass:[NSNumber class]]) {
//                        correctNumbersInLevel += 1;
//                    }
//                }
        
                
                while ([sortedArray[currentLevel] count] == 2) {
                    if (currentLevel == 0) {
                        break;
                    }
                    currentLevel -= 1;
                }
                if (currentLevel == 0) {
                    currentLevel +=1;
                    while ([sortedArray[currentLevel] count] == 2) {
                        currentLevel += 1;
                    }
                }
            }

            if (nullCounter == 2) {
                [sortedArray[currentLevel] addObject:tree[i]];
                NSLog(@"%@, current level: %ld", sortedArray, (long)currentLevel);
    //            for (NSInteger i = currentLevel; i >=0; i--) {
    //                currentLevel -= 1;
    //            }
    //
                while ([sortedArray[currentLevel] count] == 2) {
                    currentLevel -= 1;
                }
                nullCounter = 0;
            }
        }
        NSMutableArray *finalArray = [NSMutableArray new];
        NSLog(@"Sorted: %@", sortedArray);
        for (int i = 0; i < sortedArray.count; i++) {
            [sortedArray[i] removeObjectIdenticalTo:[NSNull null]];
        }
        
        
        for (NSMutableArray *array in sortedArray) {
//            if  !(array.count == 1 && [array objectAtIndex:0] == [NSNull null]) {
            if (array.count != 0) {
                if ([array objectAtIndex:0] != [NSNull null]) {
                    [finalArray addObject:array];
                }
                if (array.count == 2 && [array objectAtIndex:0] == [NSNull null]) {
                    [array removeObjectAtIndex:0];
                    [finalArray addObject:array];
                }
            }
//            }
        }
      
        NSLog(@"Final %@", finalArray);
        
        
        
//        NSString *dateString = @"19-May-2021";
////        NSDate *date = [NSDate date];
//        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:@"gregorian"];
//    //    [calendar setFirstWeekday:0];
//    //    NSUInteger weekday = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSWeekCalendarUnit forDate:date];
////        NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:date];
//        NSDateComponents *components = [NSDateComponents new];
//
//        [components setMonth:5];
//        [components setDay:19];
//        [components setYear:2021];
//
//        NSDate *date = [calendar dateFromComponents:components];
//        if (![components isValidDateInCalendar:calendar]) {
//            NSLog(@"nil");
//        }
//
//        NSDateFormatter *dateFormat = [NSDateFormatter new];
//        [dateFormat setTimeZone:[NSTimeZone localTimeZone]];
//        NSLocale *ru = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
//        [dateFormat setLocale:ru];
//    //    dateFormat.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
//        [dateFormat setDateFormat:@"E"];
//
//        NSDate *newDate = [[NSCalendar currentCalendar] dateFromComponents:components];
//        NSString *weekdayShortString = [dateFormat stringFromDate:newDate];
//
//        NSLog(@"%@", weekdayShortString);
        
        
//        NSString *string1 = @"ACA";
//        NSString *string2 = @"BCF";
////        NSString *resulttString = @"ABCACF";
//        NSMutableString *resultString = [NSMutableString string];
//        NSMutableString *mutableString1 = [string1 mutableCopy];
//        NSMutableString *mutableString2 = [string2 mutableCopy];
////        [resultString appendString:[mutableString1 substringToIndex:1]];
////        NSString *substring =[mutableString1 substringToIndex:1];
////
////        NSLog(@"Sub string: %@", substring);
////        NSLog(@"Result string: %@", resultString);
////        [resultString appendString:@"A"];
////        NSLog(@"Result string: %@", resultString);
////        char testt = [mutableString2 characterAtIndex:0];
//////        NSString *test =[mutableString2 characterAtIndex:0];
////        NSLog(@"test: %c", testt);
//////        NSLog(@"%@", test);
//        
//        while (![mutableString1  isEqual: @""] && ![mutableString2  isEqual: @""]) {
//            if ([mutableString1 characterAtIndex:0] < [mutableString2 characterAtIndex:0]) {
//                [resultString appendString:[mutableString1 substringToIndex:1]];
//                [mutableString1 deleteCharactersInRange:NSMakeRange(0, 1)];
//                continue;
//            } else if ([mutableString1 characterAtIndex:0] > [mutableString2 characterAtIndex:0]) {
//                [resultString appendString:[mutableString2 substringToIndex:1]];
//                [mutableString2 deleteCharactersInRange:NSMakeRange(0, 1)];
//                continue;
//            } else if ([mutableString1 characterAtIndex:0] == [mutableString2 characterAtIndex:0]) {
//                if ([mutableString1 characterAtIndex:1] < [mutableString2 characterAtIndex:1]) {
//                    [resultString appendString:[mutableString1 substringToIndex:1]];
//                    [mutableString1 deleteCharactersInRange:NSMakeRange(0, 1)];
//                    continue;
//                } else {
//                    [resultString appendString:[mutableString2 substringToIndex:1]];
//                    [mutableString2 deleteCharactersInRange:NSMakeRange(0, 1)];
//                    continue;
//                }
//            }
//        }
//
//        if ([mutableString1  isEqual: @""]) {
//            while (![mutableString2  isEqual: @""]) {
//                [resultString appendString:[mutableString2 substringToIndex:1]];
//                [mutableString2 deleteCharactersInRange:NSMakeRange(0, 1)];
//            }
//        }
//        
//        if ([mutableString2  isEqual: @""]) {
//            while (![mutableString1  isEqual: @""]) {
//                [resultString appendString:[mutableString1 substringToIndex:1]];
//                [mutableString1 deleteCharactersInRange:NSMakeRange(0, 1)];
//            }
//        }
//        
//        if ([mutableString1  isEqual: @""] && [mutableString1  isEqual: @""]) {
//            NSLog(@"Result string: %@", resultString);
//            return resultString;
//        }
//        
//        NSLog(@"Result string: %@", resultString);
//
//
//        NSArray *string1Array = [string1 componentsSeparatedByString:@""];
//        NSArray *string2Array = [string2 componentsSeparatedByString:@""];
//        NSUInteger longestStringCount = 0;
//        NSUInteger diffStringCount = 0;
//        NSUInteger shortStringCount = 0;
//
//
//        if (string1.length > string2.length) {
//            longestStringCount = string1Array.count;
//            shortStringCount = string2Array.count;
//            diffStringCount = longestStringCount - shortStringCount;
//
//        } else {
//            longestStringCount = string2Array.count;
//            shortStringCount = string1Array.count;
//            diffStringCount = longestStringCount - shortStringCount;
//        }
//
//        for (int i = 0; i < longestStringCount; i++) {
//            if (string1Array[i] == string2Array[i]) {
//                if (i + 1 < shortStringCount) {
//                    if (string1Array[i+1] < string2Array[i+1]) {
//                        [resultString appendString:string2Array[i]];
//                    }
//                }
//            }
//        }
        
        
//        
//        NSInteger counter = 0;
//        
////        NSArray *ratingArray = @[@9,@5,@6,@4];
////        NSArray *ratingArray = @[@2,@5,@3,@4,@1];
//        NSArray *ratingArray = @[@0,@1,@2,@3,@4,@5,@6,@7,@8,@9];
//        
//        NSMutableArray *arrayOfArrays = [NSMutableArray new];
//        
//    
//        
//        for (int i = 0; i < ratingArray.count; i++) {
//            NSArray *array = [NSArray arrayWithObjects:ratingArray[i], [NSNumber numberWithInt:i], nil];
//            [arrayOfArrays addObject:array];
//        }
//        
//    //    NSArray *sortedArray;
//    //    sortedArray = [drinkDetails sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
//    //        NSDate *first = [(Person*)a birthDate];
//    //        NSDate *second = [(Person*)b birthDate];
//    //        return [first compare:second];
//    //    }];
//        
//        [arrayOfArrays sortUsingComparator:^(id obj1, id obj2) {
//            if ([[obj1 objectAtIndex:0] intValue] > [[obj2 objectAtIndex:0] intValue]) {
//                return (NSComparisonResult)NSOrderedDescending;
//            }
//            if ([[obj1 objectAtIndex:0] intValue] < [[obj2 objectAtIndex:0] intValue]) {
//                return (NSComparisonResult)NSOrderedAscending;
//            }
//            return (NSComparisonResult)NSOrderedSame;
//        }];
//        
//                NSInteger testCounter = 0;
//        
//                for (int i = 0; i < ratingArray.count-2; i++) {
//                    for (int j = i+1; j < ratingArray.count-1; j++) {
//                        for (int k = j+1; k < ratingArray.count; k++) {
//                            if ((([ratingArray[i] intValue] < [ratingArray[j] intValue]) && ([ratingArray[j] intValue] < [ratingArray[k] intValue]))
//                                 ||
//                                 (([ratingArray[i] intValue] > [ratingArray[j] intValue]) && ([ratingArray[j] intValue] > [ratingArray[k] intValue]))
//                                 )
//                            {
//                                NSLog(@"Found! %d, %d, %d", i, j, k);
//                                testCounter += 1;
//                            }
//                        }
//                    }
//                }
//                NSLog(@"TResult: %ld", (long)testCounter);
//        
////        NSInteger testCounter = 0;
////
////        for (int i = 0; i < arrayOfArrays.count-2; i++) {
////            for (int j = i+1; j < arrayOfArrays.count-1; j++) {
////                for (int k = j+1; k < arrayOfArrays.count; k++) {
////                    if ((([[arrayOfArrays[i] objectAtIndex:0] intValue] < [[arrayOfArrays[j] objectAtIndex:0] intValue] < [[arrayOfArrays[k] objectAtIndex:0] intValue])
////                         &&
////                         ([[arrayOfArrays[i] objectAtIndex:1] intValue] < [[arrayOfArrays[i+1] objectAtIndex:1] intValue] < [[arrayOfArrays[i+2] objectAtIndex:1] intValue]))
////                         ||
////                         (([[arrayOfArrays[k] objectAtIndex:0] intValue] > [[arrayOfArrays[j] objectAtIndex:0] intValue] > [[arrayOfArrays[i] objectAtIndex:0] intValue])
////                           &&
////                           ([[arrayOfArrays[k] objectAtIndex:1] intValue] < [[arrayOfArrays[j] objectAtIndex:1] intValue] < [[arrayOfArrays[i] objectAtIndex:1] intValue]))
////                         ) {
////                        NSLog(@"Fn");
////                        testCounter += 1;
////                    }
////                }
////            }
////        }
////        NSLog(@"TResult: %ld", (long)testCounter);
//        
//        
//        
//        for (int i = 0; i < arrayOfArrays.count-2; i++) {
//            
//            NSLog(@"Iteration i= %d", i);
//            if ((([[arrayOfArrays[i] objectAtIndex:0] intValue] < [[arrayOfArrays[i+1] objectAtIndex:0] intValue] < [[arrayOfArrays[i+2] objectAtIndex:0] intValue])
//                &&
//                ([[arrayOfArrays[i] objectAtIndex:1] intValue] < [[arrayOfArrays[i+1] objectAtIndex:1] intValue] < [[arrayOfArrays[i+2] objectAtIndex:1] intValue]))
//                ||
//                (([[arrayOfArrays[i+2] objectAtIndex:0] intValue] > [[arrayOfArrays[i+1] objectAtIndex:0] intValue] > [[arrayOfArrays[i] objectAtIndex:0] intValue])
//                  &&
//                  ([[arrayOfArrays[i+2] objectAtIndex:1] intValue] < [[arrayOfArrays[i+1] objectAtIndex:1] intValue] < [[arrayOfArrays[i] objectAtIndex:1] intValue]))
//                ) {
//                NSLog(@"Found! %d", i);
//                counter += 1;
//            }
//        }
//        
//        
//        
//        NSInteger descendingCounter = 0;
//        
//        for (int i = 0; i < arrayOfArrays.count-2; i++) {
//            if (
//                
//                ([[arrayOfArrays[i] objectAtIndex:0] intValue] > [[arrayOfArrays[i+1] objectAtIndex:0] intValue]) && ([[arrayOfArrays[i+1] objectAtIndex:0] intValue] > [[arrayOfArrays[i+2] objectAtIndex:0] intValue])
//                ) {
//                NSLog(@"Found!");
//                descendingCounter += 1;
//            }
//        }
//        NSLog(@"DResult: %ld", (long)descendingCounter);
//        NSLog(@"Result: %ld", (long)counter);
//        
//        
//        
//        
//        NSLog(@"%@", arrayOfArrays);
//        
//        End of my code
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
