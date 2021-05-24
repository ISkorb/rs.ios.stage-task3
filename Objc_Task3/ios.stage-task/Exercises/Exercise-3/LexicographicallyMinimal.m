#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2
{
    @autoreleasepool
    {
        if(string1.length == 0 || string2.length == 0)
        {
            return nil;
        }
       
        NSString* concat = [string1 stringByAppendingString:string2];
        NSMutableArray* letterArray = [[NSMutableArray alloc]init];
        
        for(int i = 0; i < concat.length; i++)
        {
            NSRange range = NSMakeRange(i, 1);
            NSString* character = [concat substringWithRange:range];
            [letterArray addObject:character];
        }
        
        id mySort = ^(NSString * a, NSString * b)
        {
            NSString* ab = [a stringByAppendingString:b];
            NSString* ba = [b stringByAppendingString:a];
            
            return [ab compare:ba];
        };
        
        NSArray* sortedArray = [letterArray sortedArrayUsingComparator:mySort];
        NSString* joinedString = [sortedArray componentsJoinedByString:@""];
        return joinedString;
    }
    return nil;
}

@end
