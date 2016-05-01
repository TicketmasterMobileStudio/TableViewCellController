//
//  TWTTableViewCellController.m
//  TableViewCellController
//
//  Created by Duncan Lewis on 8/10/15.
//  Copyright © 2015 Ticketmaster Entertainment, Inc. All rights reserved.
//

#import "TWTTableViewCellController.h"

#import "TWTTableViewCellControllerDelegate.h"


@interface TWTTableViewCellController ()

//@property (nonatomic, weak, readwrite) UITableView *tableView;
//@property (nonatomic, weak, readwrite) UITableViewCell *cell;
@property (nonatomic, strong, readwrite) NSIndexPath *indexPath;

@end


@implementation TWTTableViewCellController

+ (NSString *)cellReuseIdentifier
{
    return NSStringFromClass(self);
}


+ (UINib *)cellNib
{
    return nil;
}


+ (Class)cellClass
{
    return nil;
}


- (void)setCell:(UITableViewCell *)cell
{
    [self willSetCell:cell];

    UITableViewCell *oldValue = _cell;
    _cell = cell;

    [self didSetCell:oldValue];
}


- (void)willSetCell:(UITableViewCell *)newValue
{

}


- (void)didSetCell:(UITableViewCell *)oldValue
{

}


+ (BOOL)shouldAutomaticallyRegisterWithTableView
{
    return YES;
}


- (CGFloat)cellHeightForWidth:(CGFloat)width
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"subclasses must provide an implementation of this method"
                                 userInfo:nil];
    return 0.0;
}

@end

