//
//  CLLPrototypeCellController.m
//  TableViewCellController
//
//  Created by Jill Cohen on 3/8/16.
//  Copyright © 2016 Ticketmaster Entertainment, Inc. All rights reserved.
//

#import "CLLPrototypeCellController.h"


@implementation CLLPrototypeCellController

+ (NSString *)cellReuseIdentifier
{
    return @"CLLPrototypeCell";
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
