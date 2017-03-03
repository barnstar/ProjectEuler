//
//  JNSolutionVC.m
//  ProjectEulerSolutions
//
//  Created by Jonathan Nobels on 2017-02-08.
//  Copyright © 2017 JNobels. All rights reserved.
//

#import "JNSolutionVC.h"
#import "JNSolutionsController.h"

@interface JNSolutionVC ()
@property (weak, nonatomic) IBOutlet UITextView *outputView;
@property (strong, nonatomic) NSMutableString *output;
@end

@implementation JNSolutionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.output = [[NSMutableString alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)clear
{
    self.output = [[NSMutableString alloc] init];
    [self.outputView setText:self.output];
}

- (void)displayText:(NSString *)text
{
    [self.output appendFormat:@"%@\n", text];
    [self.outputView setText:self.output];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.solution setRenderer:nil];
    [self.solution stop];
}


#pragma mark - Navigation

- (IBAction)runPressed:(id)sender {
    [self.solution stop];
    [self clear];
    [self.solution run];
}


- (IBAction)stopPressed:(id)sender {
    [self.solution stop];
}

@end
