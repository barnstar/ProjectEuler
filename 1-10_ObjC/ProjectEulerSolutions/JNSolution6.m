//
//  JNSolution6.m
//  ProjectEulerSolutions
//
//  Created by Jonathan Nobels on 2017-02-09.
//  Copyright © 2017 JNobels. All rights reserved.
//

#import "JNSolution6.h"

@implementation JNSolution6

- (id)init
{
    self = [super init];
    self.title = @"5: Sum of squares minus square of sums";
    self.problemDescription = @"1-100 sum of squares minus square of sums";
    return self;
}

- (void)run
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self output:self.problemDescription];
        long long sumOfSquares = 0;
        long long sum = 0;
        long long squareOfSums = 0;

        for(int i=0;i<=100;i++) {
            sumOfSquares += i * i;
            sum += i;
        }

        squareOfSums = sum * sum;
        long long difference = squareOfSums - sumOfSquares;

        [self output:[NSString stringWithFormat:@"Difference is: %lld", difference]];
    });
}




- (void)stop
{
    //Do nothing...
}


@end
