//
//  CLLColorCellController.m
//  TableViewCellController
//
//  Created by Jill Cohen on 3/2/16.
//  Copyright © 2016 Ticketmaster Entertainment, Inc. All rights reserved.
//

#import "CLLColorCellController.h"


@implementation CLLColorCellController

- (void)didSetCell:(UITableViewCell *)oldValue
{
    [super didSetCell:oldValue];
    
    self.cell.contentView.backgroundColor = self.color;
}


+ (Class)cellClass
{
    return [UITableViewCell class];
}


- (CGFloat)cellHeightForWidth:(CGFloat)width
{
    return 75;
}

@end
