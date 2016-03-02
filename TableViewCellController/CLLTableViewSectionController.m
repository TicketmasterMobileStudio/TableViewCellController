//
//  CLLTableViewSectionController.m
//  TableViewCellController
//
//  Created by Duncan Lewis on 8/10/15.
//  Copyright © 2015 Ticketmaster Entertainment, Inc. All rights reserved.
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
