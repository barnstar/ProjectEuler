//
//  ViewController.m
//  ProjectEulerSolutions
//
//  Created by Jonathan Nobels on 2017-02-08.
//  Copyright © 2017 JNobels. All rights reserved.
//

#import "JNSolutionPickerVC.h"
#import "JNSolutionVC.h"
#import "JNSolutionsController.h"
#import "JNProblemCell.h"

@interface JNSolutionPickerVC (/* Private */)
@property (strong, nonatomic) JNSolutionsController *controller;
@end

@implementation JNSolutionPickerVC

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.controller = [[JNSolutionsController alloc] init];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.controller.solutions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JNProblemCell *cell = (JNProblemCell *)[tableView dequeueReusableCellWithIdentifier:@"solutionCell"];
    cell.solution = self.controller.solutions[indexPath.row];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    JNProblemCell *cell = (JNProblemCell *)sender;
    JNSolutionVC *dest = (JNSolutionVC *)[segue destinationViewController];
    dest.solution = cell.solution;
    dest.navigationController.title = cell.solution.title;
    [cell.solution setRenderer:dest];
}

@end
