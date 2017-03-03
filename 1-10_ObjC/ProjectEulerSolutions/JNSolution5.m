//
//  JNSolution5.m
//  ProjectEulerSolutions
//
//  Created by Jonathan Nobels on 2017-02-09.
//  Copyright © 2017 JNobels. All rights reserved.
//

#import "JNSolution5.h"

@implementation JNSolution5

- (id)init
{
    self = [super init];
    self.title = @"5: Smallest number evenly divisible by 1-20";
    self.problemDescription = @"Find the smallest number that is evenly divislbe by the integers 1-20";
    return self;
}

- (void)run
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self output:self.problemDescription];

        BOOL haveResult = NO;
        long num = 20;

        //We don't need to check factors less than 11 since 11->20 will can be factored
        //by all of them.
        while(NO == haveResult)
        {
            haveResult = YES;
            for(long i=20; i>10; i--) {
                if(num % i != 0) {
                    num+=20; //The number has to be factorable by 20, so add 20...
                    haveResult = NO;
                    break;
                }
            }
        }
        [self output:[NSString stringWithFormat:@"Result is %ld", num]];

    });
}




- (void)stop
{
    //Do nothing...
}


@end
