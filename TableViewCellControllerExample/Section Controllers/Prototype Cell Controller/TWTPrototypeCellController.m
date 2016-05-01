//
//  TWTPrototypeCellController.m
//  TableViewCellController
//
//  Created by Jill Cohen on 3/8/16.
//  Copyright © 2016 Ticketmaster Entertainment, Inc. All rights reserved.
//

#import "TWTPrototypeCellController.h"


@implementation TWTPrototypeCellController

+ (NSString *)cellReuseIdentifier
{
    return @"TWTPrototypeCell";
}


+ (BOOL)shouldAutomaticallyRegisterWithTableView
{
    return NO;
}

- (CGFloat)cellHeightForWidth:(CGFloat)width
{
    return 60;
}

@end
