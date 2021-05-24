#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    if (ratingArray == nil || ratingArray.count <= 2) {
        return 0;
    }

    NSInteger testCounter = 0;

    for (int i = 0; i < ratingArray.count-2; i++) {
        for (int j = i+1; j < ratingArray.count-1; j++) {
            for (int k = j+1; k < ratingArray.count; k++) {
                if ((([ratingArray[i] intValue] < [ratingArray[j] intValue]) && ([ratingArray[j] intValue] < [ratingArray[k] intValue]))
                     ||
                     (([ratingArray[i] intValue] > [ratingArray[j] intValue]) && ([ratingArray[j] intValue] > [ratingArray[k] intValue]))
                     )
                {
//                    NSLog(@"Found! %d, %d, %d", i, j, k);
                    testCounter += 1;
                }
            }
        }
    }
    NSLog(@"TResult: %ld", (long)testCounter);
    return  testCounter;
   
}

@end
