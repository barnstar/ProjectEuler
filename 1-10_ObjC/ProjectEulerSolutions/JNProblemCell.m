//
//  JNProblemCell.m
//  ProjectEulerSolutions
//
//  Created by Jonathan Nobels on 2017-02-08.
//  Copyright © 2017 JNobels. All rights reserved.
//

#import "JNProblemCell.h"

@interface JNProblemCell (/* Private */ )
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation JNProblemCell

- (void)setSolution:(JNSolution *)solution
{
    if(_solution != solution) {
        _solution = solution;
        [self.titleLabel setText:solution.title];
    }
}

@end
