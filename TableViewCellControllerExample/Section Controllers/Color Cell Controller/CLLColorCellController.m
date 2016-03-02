//
//  CLLColorCellController.m
//  TableViewCellController
//
//  Created by Jill Cohen on 3/2/16.
//  Copyright © 2016 Ticketmaster Entertainment, Inc. All rights reserved.
//

#import "CLLColorCellController.h"


@implementation CLLColorCellController

- (NSString *)cellReuseIdentifier
{
    return NSStringFromClass(self.class);
}


- (void)configureCell:(UITableViewCell *)cell
{
    [super configureCell:cell];
    
    cell.backgroundColor = [self randomColor];
}


- (UIColor *)randomColor
{
    CGFloat hue = (arc4random() % 256 / 255.0);              // 0.0 to 1.0
    CGFloat saturation = (arc4random() % 128 / 255.0) + 0.5; // 0.5 to 1.0, away from white
    CGFloat brightness = (arc4random() % 128 / 255.0) + 0.3; // 0.3 to 0.8, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}


- (Class)cellClass
{
    return [UITableViewCell class];
}


-(CGFloat)cellHeightForWidth:(CGFloat)width
{
    return 75;
}

@end
