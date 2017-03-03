//
//  JNSolutionUtil.h
//  ProjectEulerSolutions
//
//  Created by Jonathan Nobels on 2017-02-09.
//  Copyright © 2017 JNobels. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JNSolutionUtil : NSObject

+ (NSString *)reverseString:(NSString *)input;

+ (NSIndexSet *)primesBelow:(long long)maxPrime;

@end
