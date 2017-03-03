//
//  JNSolution7.m
//  ProjectEulerSolutions
//
//  Created by Jonathan Nobels on 2017-02-09.
//  Copyright © 2017 JNobels. All rights reserved.
//

#import "JNSolution7.h"

@implementation JNSolution7

static const long nthPrime = 10001;

- (id)init
{
    self = [super init];
    self.title = @"7: 10001st Prime";
    self.problemDescription = @"Find the 10001st prime";
    return self;
}

- (void)run
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self output:self.problemDescription];

        NSMutableIndexSet *primes = [[NSMutableIndexSet alloc] init];

        [primes addIndex:2];
        long valToCheck = 1;


        while(primes.count < nthPrime) {
            __block BOOL isPrime = YES;
            valToCheck += 2;

            [primes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
                if(valToCheck % idx == 0) {
                    isPrime = NO;
                    *stop = YES;
                }
            }];
            if(isPrime) [primes addIndex:valToCheck];
        }

        [self output:[NSString stringWithFormat:@"10001st Prime is %ld", valToCheck]];
    });

}

- (void)stop
{
    //Do nothing...
}


@end
