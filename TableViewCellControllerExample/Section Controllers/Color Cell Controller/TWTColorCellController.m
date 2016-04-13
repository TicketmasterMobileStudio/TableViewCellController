//
//  TWTColorCellController.m
//  TableViewCellController
//
//  Created by Jill Cohen on 3/2/16.
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

#import "TWTColorCellController.h"


@implementation TWTColorCellController

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
