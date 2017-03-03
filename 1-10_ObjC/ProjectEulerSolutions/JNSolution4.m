//
//  JNSolution4.m
//  ProjectEulerSolutions
//
//  Created by Jonathan Nobels on 2017-02-09.
//  Copyright © 2017 JNobels. All rights reserved.
//

#import "JNSolution4.h"

@implementation JNSolution4

- (id)init
{
    self = [super init];
    self.title = @"4: Largest palindrome that's a mutliple of 2 3 digit numbers";
    self.problemDescription = @"Largest palindrome that's a mutliple of 2 3 digit numbers";
    return self;
}

- (void)run
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self output:self.problemDescription];

        long largestPalindrome = 0;
        long factorA = 0;
        long factorB = 0;

        //Brute force with some optimization to break early.
        for(int i = 999; i>=100; i--) {
            long valToCheck = i * 999;
            if(valToCheck < largestPalindrome) {
                break;
            }

            for(int j = 999; i>=100; j--) {
                valToCheck = valToCheck - i;  //Slightly quicker than multiplying
                if(valToCheck < largestPalindrome) {
                    break;
                }

                //It's a palindrome if its string rep is equivalent to the reversed string
                NSString *valString = [NSString stringWithFormat:@"%ld", valToCheck];
                NSString *valStringRev = [JNSolutionUtil reverseString:valString];

                if([valString isEqualToString:valStringRev]) {
                    largestPalindrome = valToCheck;
                    factorA = j;
                    factorB = i;
                }
            }
        }
        [self output:[NSString stringWithFormat:@"Largest Palindrome is %ld  ( %ld X %ld )", largestPalindrome, factorB, factorA]];
    });
}




- (void)stop
{
    //Do nothing...
}

@end
