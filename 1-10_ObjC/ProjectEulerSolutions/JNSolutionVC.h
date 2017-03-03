//
//  JNSolutionVC.h
//  ProjectEulerSolutions
//
//  Created by Jonathan Nobels on 2017-02-08.
//  Copyright © 2017 JNobels. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JNSolutionsController.h"

@interface JNSolutionVC : UIViewController <JNSolutionRenderer>

@property (strong, nonatomic) JNSolution *solution;

@end
