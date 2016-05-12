//
//  CLLTableViewCellControllerDelegate.h
//  TableViewCellController
//
//  Created by Duncan Lewis on 8/11/15.
//  Copyright © 2015 Ticketmaster Entertainment, Inc. All rights reserved.
//

@import Foundation;

@class CLLTableViewCellController;


/*!
 The CLLTableViewCellControllerDelegate protocol declares a set of messages that allows a cell controller communicate
 necessary changes, e.g., needing to be reloaded or animating a height change.
 */
@protocol CLLTableViewCellControllerDelegate <NSObject>

/*!
 @abstract Invoked when the cell controller’s cell needs to be reloaded.
 @param cellController The cell controller whose cell needs to be reloaded.
 */
- (void)cellControllerRequiresReload:(CLLTableViewCellController *)cellController;

/*!
 @abstract Invoked when the cell controller’s cell needs an animated height change.
 @param cellController The cell controller whose cell needs an animated height change.
 */
- (void)cellControllerRequiresAnimatedHeightChange:(CLLTableViewCellController *)cellController;

@end
