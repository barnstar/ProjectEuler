//
//  JNSolutionsController.m
//  ProjectEulerSolutions
//
//  Created by Jonathan Nobels on 2017-02-08.
//  Copyright © 2017 JNobels. All rights reserved.
//

#import "JNSolutionsController.h"

@interface JNSolutionsController ( /* private */ )
@property (nonatomic, readwrite) NSArray *solutions;
@end


@implementation JNSolutionsController

- (id)init
{
    if( ( self = [super init]) ) {
        [self loadSolutions];
    }
    return self;
}

- (void)loadSolutions
{
    NSArray *solutionList = @[@(1), @(2), @(3), @(4), @(5), @(6), @(7), @(8), @(9), @(10)];
    NSMutableArray *solutions = [NSMutableArray array];

    for(NSNumber *solutionNum in solutionList) {
        NSString *className = [NSString stringWithFormat:@"JNSolution%ld", solutionNum.longValue];
        Class solutionClass = NSClassFromString(className);
        JNSolution *solution = [[solutionClass alloc] init];
        [solutions addObject:solution];
    }
    
    self.solutions = solutions;
}

@end



@interface JNSolution (/* Private */ )
@property (nonatomic, weak) id<JNSolutionRenderer> renderer;
@end

@implementation JNSolution

- (void)setRenderer:(id<JNSolutionRenderer>)renderer;
{
    _renderer = renderer;
}

- (void)output:(NSString *)text
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.renderer displayText:text];
    });
}

- (void)run
{
    [self output:@"Hello World"];
}


- (void)stop
{
    [self output:@"Stopping"];
}


@end
