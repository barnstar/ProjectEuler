//
//  JNSolution3.m
//  ProjectEulerSolutions
//
//  Created by Jonathan Nobels on 2017-02-08.
//  Copyright © 2017 JNobels. All rights reserved.
//

#import "JNSolution3.h"

@implementation JNSolution3

static const long long valToFactor = 600851475143;

- (id)init
{
    self = [super init];
    self.title = @"3: Largest Prime Factor";
    self.problemDescription = @"The prime factors of 13195 are 5, 7, 13 and 29.\n"
                              @"What is the largest prime factor of the number 600851475143 ?\n\n";
    return self;
}

- (void)run
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self output:self.problemDescription];

        NSMutableIndexSet *primes = [[NSMutableIndexSet alloc] init];

        [primes addIndex:2];
        long valToCheckForPrimality = 3;

        long largestFactor = 0;
        long long target = valToFactor;

        while(valToCheckForPrimality <= target) {
            __block BOOL isPrime = YES;
            [primes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
                if(valToCheckForPrimality % idx == 0) {
                    isPrime = NO;
                    *stop = YES;
                }
            }];
            if(isPrime) {
                [primes addIndex:valToCheckForPrimality];
                if(target % valToCheckForPrimality == 0) {
                    largestFactor = valToCheckForPrimality;
                    //Factor the target
                    while(target % valToCheckForPrimality == 0) {
                        [self output:[NSString stringWithFormat:@"Found prime factor: %ld", valToCheckForPrimality]];
                        target = target/valToCheckForPrimality;
                    }
                }
            }
            valToCheckForPrimality +=2;
        }

        [self output:[NSString stringWithFormat:@"\nLargest prime factor of %lld is %lld", valToFactor, largestFactor]];
    });

}

- (void)stop
{
    //Do nothing...
}

@end
