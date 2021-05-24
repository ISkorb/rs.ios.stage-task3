#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber
{
    @autoreleasepool
    {
        int month = (int) monthNumber;
        
        if(!month || month < 1 || month > 12)
        {
            return nil;
        }
        
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MMMM"];
        NSString* monthName = [[dateFormatter monthSymbols] objectAtIndex:(month - 1)];
        
        return monthName;
    }
    return nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date
{
    @autoreleasepool
    {
        if(date.length == 0)
        {
            return 0;
        }
        
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    
        NSDate* dateParsed = [[NSDate alloc] init];
        dateParsed = [dateFormatter dateFromString:date];
        
        if(dateParsed)
        {
            NSCalendar* calendar = [NSCalendar currentCalendar];
            NSDateComponents* dateComponents =
                [calendar components: NSCalendarUnitDay | NSCalendarUnitWeekday fromDate: dateParsed];
        
            return dateComponents.day;
        }
        
        return 0;
    }
    return 0;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date
{
    @autoreleasepool
    {
        if(date)
        {
            NSCalendar* calendar = [NSCalendar currentCalendar];
            NSDateComponents* dateComponents =
                [calendar components: NSCalendarUnitDay | NSCalendarUnitWeekday fromDate: date];
            int weekday = (int)[dateComponents weekday];
            
            NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
            NSLocale* locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru"];
            [dateFormatter setLocale:locale];
            NSString* dayName = [[dateFormatter shortWeekdaySymbols] objectAtIndex:(weekday - 1)];
            
            return dayName;
        }
        
        return nil;
    }
    
    return nil;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date
{
    @autoreleasepool
    {
        if(date)
        {
            NSCalendar* gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
            NSDateComponents* todaysComponents = [gregorian components:NSCalendarUnitWeekOfYear | NSCalendarUnitYear fromDate:[NSDate now]];
            NSUInteger todaysWeek = [todaysComponents weekOfYear];
            NSUInteger todaysYear = [todaysComponents year];
            NSDateComponents* otherComponents = [gregorian components:NSCalendarUnitWeekOfYear  | NSCalendarUnitYear fromDate:date];
            NSUInteger datesWeek = [otherComponents weekOfYear];
            NSUInteger datesYear = [otherComponents year];

            if((todaysWeek == datesWeek) && (todaysYear == datesYear))
            {
                return YES;
            }
        }
        
        return NO;
    }
    
    return NO;
}

@end
