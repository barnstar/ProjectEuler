//
//  JNSolutionsController.h
//  ProjectEulerSolutions
//
//  Created by Jonathan Nobels on 2017-02-08.
//  Copyright © 2017 JNobels. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JNSolutionUtil.h"

@protocol JNSolutionRenderer
@required
- (void)clear;
- (void)displayText:(NSString *)text;
@end



@interface JNSolutionsController : NSObject
@property (nonatomic, readonly) NSArray *solutions;
@end


#pragma mark - Solution Base Class

@interface JNSolution : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *problemDescription;

- (void)setRenderer:(id<JNSolutionRenderer>)renderer;
- (void)output:(NSString *)text;

- (void)run;
- (void)stop;


@end
