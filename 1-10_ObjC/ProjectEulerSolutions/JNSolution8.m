//
//  JNSolution8.m
//  ProjectEulerSolutions
//
//  Created by Jonathan Nobels on 2017-02-09.
//  Copyright © 2017 JNobels. All rights reserved.
//

#import "JNSolution8.h"

static const NSString *num =
@"73167176531330624919225119674426574742355349194934"
@"96983520312774506326239578318016984801869478851843"
@"85861560789112949495459501737958331952853208805511"
@"12540698747158523863050715693290963295227443043557"
@"66896648950445244523161731856403098711121722383113"
@"62229893423380308135336276614282806444486645238749"
@"30358907296290491560440772390713810515859307960866"
@"70172427121883998797908792274921901699720888093776"
@"65727333001053367881220235421809751254540594752243"
@"52584907711670556013604839586446706324415722155397"
@"53697817977846174064955149290862569321978468622482"
@"83972241375657056057490261407972968652414535100474"
@"82166370484403199890008895243450658541227588666881"
@"16427171479924442928230863465674813919123162824586"
@"17866458359124566529476545682848912883142607690042"
@"24219022671055626321111109370544217506941658960408"
@"07198403850962455444362981230987879927244284909188"
@"84580156166097919133875499200524063689912560717606"
@"05886116467109405077541002256983155200055935729725"
@"71636269561882670428252483600823257530420752963450";

@implementation JNSolution8

- (id)init
{
    self = [super init];
    self.title = @"8: Largest product of 13 consecutive digits";
    self.problemDescription = @"Find the largest product of 13 consecutive digits";
    return self;
}


- (void)run
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self output:self.problemDescription];
        static const int rangeLen = 13;
        int rangeStart = 13;
        long long largestProduct = 0;
        NSString* largestProductString;

        while(rangeStart + rangeLen < num.length) {
            long long product = 1;
            //We could keep the previous product, divide by rangeStart-1, etc.. But
            //it that might only be marginally faster than must multiplying 13 digits due
            //to the integer division operaton.
            for(int i=rangeStart;i<rangeStart+rangeLen;i++)  {
                NSString *digit = [num substringWithRange:NSMakeRange(i, 1)];
                long long val = digit.longLongValue;
                if(val == 0) {  //We can fastforward past a 0 value.
                    rangeStart = i+1;
                    break;
                }
                product = product * digit.longLongValue;
            }
            if(product > largestProduct){
                largestProduct = product;
                largestProductString = [num substringWithRange:NSMakeRange(rangeStart, rangeLen)];
            }
            rangeStart++;
        }
        [self output:[NSString stringWithFormat:@"Largest Product is %lld (%@)", largestProduct, largestProductString]];
    });
    
}

- (void)stop
{
    //Do nothing...
}

@end
