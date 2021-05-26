#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    NSInteger res = 0;
    BOOL iLessJ, jLessK, asc, iGreatJ, jGreatK, desc;
    
    for (int i = 0; i < ratingArray.count; i++) {
        for (int j = i + 1; j < ratingArray.count; j++) {
            for (int k = j + 1; k < ratingArray.count; k++) {
                iLessJ = [ratingArray[i] intValue] < [ratingArray[j] intValue];
                jLessK = [ratingArray[j] intValue] < [ratingArray[k] intValue];
                asc = iLessJ && jLessK;
                iGreatJ = [ratingArray[i] intValue] > [ratingArray[j] intValue];
                jGreatK = [ratingArray[j] intValue] > [ratingArray[k] intValue];
                desc = iGreatJ && jGreatK;
                
                if (asc || desc) {
                    res++;
                }
            }
        }
    }
    NSLog(@"input: %@\nres: %ld", ratingArray, (long)res);
    return res;
}

@end
