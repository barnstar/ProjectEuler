//
//  JNSolutionUtil.m
//  ProjectEulerSolutions
//
//  Created by Jonathan Nobels on 2017-02-09.
//  Copyright © 2017 JNobels. All rights reserved.
//

#import "JNSolutionUtil.h"

@implementation JNSolutionUtil

+ (NSString *)reverseString:(NSString *)input
{
    NSUInteger len = [input length];
    unichar *buffer = malloc(len * sizeof(unichar));
    [input getCharacters:buffer];

    // reverse string; only need to loop through first half
    for (NSUInteger stPos=0, endPos=len-1; stPos < len/2; stPos++, endPos--) {
        unichar temp = buffer[stPos];
        buffer[stPos] = buffer[endPos];
        buffer[endPos] = temp;
    }

    return [[NSString alloc] initWithCharactersNoCopy:buffer length:len freeWhenDone:YES];
}


+ (NSIndexSet *)primesBelow:(long long)maxPrime
{
    NSMutableIndexSet *primes = [[NSMutableIndexSet alloc] init];

    [primes addIndex:2];
    long valToCheckForPrimality = 3;

    while(valToCheckForPrimality <= maxPrime) {
        __block BOOL isPrime = YES;
        [primes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
            if(valToCheckForPrimality % idx == 0) {
                isPrime = NO;
                *stop = YES;
            }
        }];
        if(isPrime) {
            [primes addIndex:valToCheckForPrimality];
        }
        valToCheckForPrimality +=2;
    }
    return primes;
}

@end
