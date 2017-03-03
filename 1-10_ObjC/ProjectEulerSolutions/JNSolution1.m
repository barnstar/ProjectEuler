//
//  JNSolution1.m
//  ProjectEulerSolutions
//
//  Created by Jonathan Nobels on 2017-02-08.
//  Copyright © 2017 JNobels. All rights reserved.
//

//https://projecteuler.net/problem=1
//If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
//Find the sum of all the multiples of 3 or 5 below 1000.

#import "JNSolution1.h"

static const int maxVal = 1000;

@implementation JNSolution1

- (id)init
{
    self = [super init];
    self.title = @"1: Sum of multiples of 3 & 5 below 1000";
    self.problemDescription = @"If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.\n"
                              @"Find the sum of all the multiples of 3 or 5 below 1000.\n\n";
    return self;
}

- (void)run
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self output:self.problemDescription];

        //Use an index set here so we don't need to bother checking for multiples of 15
        NSMutableIndexSet *multiples = [[NSMutableIndexSet alloc] init];
        for(NSUInteger i=3; i<maxVal; i+=3) [multiples addIndex:i];
        for(NSUInteger i=5; i<maxVal; i+=5) [multiples addIndex:i];
        __block int sum = 0;
        [multiples enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) { sum += idx; }];

        [self output:[NSString stringWithFormat:@"Sum of multiples is %ld", (long)sum]];
    });

}

- (void)stop
{
    //Do nothing...
}



@end
