//
//  CLLTableViewCellController.m
//  TableViewCellController
//
//  Created by Duncan Lewis on 8/10/15.
//  Copyright © 2015 Ticketmaster Entertainment, Inc. All rights reserved.
//

#import "CLLTableViewCellController.h"

#import "CLLTableViewCellControllerDelegate.h"


@interface CLLTableViewCellController ()

@property (nonatomic, weak, readwrite) UITableView *tableView;
@property (nonatomic, weak, readwrite) UITableViewCell *cell;
@property (nonatomic, strong, readwrite) NSIndexPath *indexPath;

@end


@implementation CLLTableViewCellController

- (NSString *)cellReuseIdentifier
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"subclasses must provide an implementation of this method"
                                 userInfo:nil];
    return nil;
}


- (UINib *)cellNib
{
    return nil;
}


- (Class)cellClass
{
    return nil;
}


- (void)beginDisplayingCell:(UITableViewCell *)cell inTableView:(UITableView *)tableView
{
    self.tableView = tableView;
    self.cell = cell;
}


- (BOOL)shouldAutomaticallyRegisterWithTableView
{
    return YES;
}


- (void)configureCell:(UITableViewCell *)cell
{

}


- (void)endDisplayingCell:(UITableViewCell *)cell inTableView:(UITableView *)tableView
{
    self.tableView = nil;
    self.cell = nil;
}


- (CGFloat)cellHeightForWidth:(CGFloat)width
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"subclasses must provide an implementation of this method"
                                 userInfo:nil];
    return 0.0;
}


- (BOOL)becomeFirstResponder
{
    if ([self.delegate respondsToSelector:@selector(cellControllerDidBecomeFirstResponder:)]) {
        [self.delegate cellControllerDidBecomeFirstResponder:self];
    }

    return YES;
}


- (BOOL)resignFirstResponder
{
    if ([self.delegate respondsToSelector:@selector(cellControllerDidResignFirstResponder:)]) {
        [self.delegate cellControllerDidResignFirstResponder:self];
    }

    return YES;
}

@end

