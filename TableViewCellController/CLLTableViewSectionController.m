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

@end
