#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (!monthNumber || monthNumber > 11) {
        return nil;
    }
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    NSString *monthName = [[df monthSymbols] objectAtIndex:(monthNumber-1)];
    return monthName;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *df = [NSDateFormatter new];
    df.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    NSDate *d = [df dateFromString:date];
    df.dateFormat = @"dd";
    long res = [[df stringFromDate:d] intValue];
    
    return res;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *df = [NSDateFormatter new];
    df.dateFormat = @"EEEEEE";
    df.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru"];
    NSString *res = [df stringFromDate:date];
    return res;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponent = [calendar components:(NSCalendarUnitWeekOfYear | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear) fromDate:date];
    NSDateComponents *dc = [calendar components:(NSCalendarUnitWeekOfYear | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear) fromDate:[NSDate date]];
    NSInteger i = dateComponent.weekOfYear;
    NSInteger j = dc.weekOfYear;
    if (i == j) {
        return YES;
    }
    return NO;
}

@end

