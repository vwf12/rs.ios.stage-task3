#import "DateHelper.h"


@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (NSLocationInRange(monthNumber, NSMakeRange(1, 12))) {
        NSDateFormatter *dateFormat = [NSDateFormatter new];
        
        [dateFormat setTimeZone:[NSTimeZone localTimeZone]];
        [dateFormat setDateFormat:@"MMMM"];
        
        NSDateComponents *components = [NSDateComponents new];

        [components setMonth:monthNumber];

        
        NSDate *newDate = [[NSCalendar currentCalendar] dateFromComponents:components];
        NSString *stringFromDate = [dateFormat stringFromDate:newDate];
        return stringFromDate;
    }
    return  nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormat = [NSDateFormatter new];
    [dateFormat setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    
    NSDate *dateObject = [dateFormat dateFromString:date];
    
    
    NSDateComponents *components =
    [[NSCalendar currentCalendar] components:(NSCalendarUnitDay |
                                              NSCalendarUnitWeekday) fromDate:dateObject];
    
    NSInteger day = [components day];
    return day;
    

}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {

    NSDateFormatter *dateFormat = [NSDateFormatter new];
    [dateFormat setTimeZone:[NSTimeZone localTimeZone]];
    NSLocale *ru = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    [dateFormat setLocale:ru];
    [dateFormat setDateFormat:@"E"];
    
    NSString *weekdayShortString = [dateFormat stringFromDate:date];
    return weekdayShortString;
    
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSDateComponents *inputDateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfYear fromDate:date];
    NSDateComponents *currentDateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfYear fromDate:[NSDate now]];
    NSUInteger inputDateWeek = [inputDateComponents weekOfYear];
    NSUInteger currentDateWeek = [currentDateComponents weekOfYear];
    
    return inputDateWeek == currentDateWeek;
}

@end
