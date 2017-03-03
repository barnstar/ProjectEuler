//
//  JNSolution10.m
//  ProjectEulerSolutions
//
//  Created by Jonathan Nobels on 2017-02-21.
//  Copyright © 2017 JNobels. All rights reserved.
//

#import "JNSolution10.h"

@implementation JNSolution10

static const long long maxPrime = 2000000;

- (id)init
{
    self = [super init];
    self.title = @"10: Sum of primes below 2000000";
    self.problemDescription = @"Find the sum of the primes below 2000000";
    return self;
}

- (void)run
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self output:self.problemDescription];

        
        NSIndexSet *primes = [JNSolutionUtil primesBelow:maxPrime];

        __block long long sum = 0;
        [primes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
            sum += idx;
        }];
        [self output:[NSString stringWithFormat:@"Sum is %lld", sum]];

    });

}

- (void)stop
{
    //Do nothing...
}


@end
