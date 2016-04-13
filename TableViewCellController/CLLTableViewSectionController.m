//
//  CLLTableViewSectionController.m
//  TableViewCellController
//
//  Created by Duncan Lewis on 8/10/15.
//  Copyright © 2016 Ticketmaster Entertainment, Inc. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "CLLTableViewSectionController.h"

#import "CLLTableViewCellController.h"


@implementation CLLTableViewSectionController

- (instancetype)init
{
    return [self initWithCellControllers:@[]];
}


- (instancetype)initWithCellControllers:(NSArray *)cellControllers
{
    NSParameterAssert(cellControllers);

    self = [super init];

    if (self) {
        _cellControllers = [cellControllers copy];
    }

    return self;
}


- (instancetype)initWithCellControllers:(NSArray<CLLTableViewCellController *> *)cellControllers sectionTitle:(NSString *)sectionTitle
{
    self = [self initWithCellControllers:cellControllers];
    self.sectionTitle = sectionTitle;

    return self;
}


- (void)setCellControllers:(NSArray *)cellControllers
{
    // TODO: the below is a temporary measure to address tableview insert/delete issues with cell controllers
    // clean up old cell controllers, since they might not be properly de-configured in cellDidEndDisplaying
    NSMutableSet *removedCellControllers = [NSMutableSet setWithArray:_cellControllers];
    [removedCellControllers minusSet:[NSMutableSet setWithArray:cellControllers]];

    for (CLLTableViewCellController *cellController in removedCellControllers) {
        [cellController endDisplayingCell:nil inTableView:nil];
    }

    _cellControllers = [cellControllers copy];
}

@end
