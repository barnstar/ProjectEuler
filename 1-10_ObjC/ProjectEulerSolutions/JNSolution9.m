//
//  JNSolution9.m
//  ProjectEulerSolutions
//
//  Created by Jonathan Nobels on 2017-02-09.
//  Copyright © 2017 JNobels. All rights reserved.
//

#import "JNSolution9.h"

@implementation JNSolution9

- (id)init
{
    self = [super init];
    self.title = @"9: Pythagorean triplet where a + b + c == 1000";
    self.problemDescription = @"Find the pythagorean triplet (a^2 + b^2 = c^2) where a+b+c=1000.";
    return self;
}

static const long tripletSum = 1000;

- (void)run
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self output:self.problemDescription];

        //Create a table of the squares of all integers < 1000
        NSMutableIndexSet *squares = [[NSMutableIndexSet alloc] init];
        for(int i=0;i<tripletSum;i++)[squares addIndex:(i * i)];

        //Brute force...
        //Should probably have done some math.. ie a^2+b^2=c^2 combine with c=1000-a-b, solve for a, solve for b, caluclate c
        //2ab-2000a-2000b+1000^2 = 0

        __block long a=0,b=0,c=0;
        [squares enumerateIndexesUsingBlock:^(NSUInteger a_sq, BOOL * _Nonnull stop) {
            __block BOOL found = NO;
            [squares enumerateIndexesUsingBlock:^(NSUInteger b_sq, BOOL * _Nonnull stop) {
                //Check if it's a triplet
                long c_sq = a_sq + b_sq;
                if([squares containsIndex:c_sq]) {
                    //It's a triplet... Check if the roots add to 100
                    long a_t = sqrt(a_sq);
                    long b_t = sqrt(b_sq);
                    long c_t = sqrt(c_sq);
                    if((a_t + b_t + c_t) == tripletSum) {
                        a=a_t; b=b_t; c=c_t;
                        found = YES;
                        *stop = YES;
                    }
                }
            }];
            *stop = found;
        }];

        long product = a*b*c;
        [self output:[NSString stringWithFormat:@"The triplet is (%ld, %ld, %ld) and the product is %ld",a,b,c,product]];
    });

}

- (void)stop
{
    //Do nothing...
}

@end
