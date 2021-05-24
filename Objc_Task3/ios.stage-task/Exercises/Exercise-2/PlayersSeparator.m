#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray
{
    @autoreleasepool
    {
        if(ratingArray == nil || ratingArray.count < 3)
        {
            return 0;
        }
        
        int arrayOfInt[ratingArray.count];
                    
        for (int i = 0; i < ratingArray.count; i++)
        {
            int currentValue = [(NSNumber *)[ratingArray objectAtIndex:i] intValue];
            arrayOfInt[i] = currentValue;
        }
         
        int n = (int)(sizeof(arrayOfInt) / sizeof(arrayOfInt[0]));
        int inversionCount = 0;
        int conversionCount = 0;
         
        for (int i = 0; i < n - 2; i++)
        {
            for (int j = i + 1; j < n - 1; j++)
            {
                for (int k = j + 1; k < n; k++)
                {
                    if (arrayOfInt[i] > arrayOfInt[j] && arrayOfInt[j] > arrayOfInt[k])
                    {
                        inversionCount++;
                    }
                    
                    if (arrayOfInt[i] < arrayOfInt[j] && arrayOfInt[j] < arrayOfInt[k])
                    {
                        conversionCount++;
                    }
                }
            }
        }
        
        return (inversionCount + conversionCount);
    }
    
    return 0;
}

@end
