//
//  TWTTableViewSectionController.m
//  TableViewCellController
//
//  Created by Duncan Lewis on 8/10/15.
//  Copyright © 2015 Ticketmaster Entertainment, Inc. All rights reserved.
//

#import "TWTTableViewSectionController.h"

#import "TWTTableViewCellController.h"


@implementation TWTTableViewSectionController

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


- (instancetype)initWithCellControllers:(NSArray<TWTTableViewCellController *> *)cellControllers sectionTitle:(NSString *)sectionTitle
{
    self = [self initWithCellControllers:cellControllers];
    self.sectionTitle = sectionTitle;

    return self;
}

@end
