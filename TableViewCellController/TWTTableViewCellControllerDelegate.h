//
//  TWTTableViewCellControllerDelegate.h
//  TableViewCellController
//
//  Created by Duncan Lewis on 8/11/15.
//  Copyright © 2015 Ticketmaster Entertainment, Inc. All rights reserved.
//

@import Foundation;

@class TWTTableViewCellController;


/*!
 The TWTTableViewCellControllerDelegate protocol declares a set of messages that allows a cell controller communicate
 necessary changes, e.g., needing to be reloaded or animating a height change.
 */
@protocol TWTTableViewCellControllerDelegate <NSObject>

/*!
 @abstract Invoked when the cell controller’s cell needs to be reloaded.
 @param cellController The cell controller whose cell needs to be reloaded.
 */
- (void)cellControllerRequiresReload:(TWTTableViewCellController *)cellController;

/*!
 @abstract Invoked when the cell controller’s cell needs an animated height change.
 @param cellController The cell controller whose cell needs an animated height change.
 */
- (void)cellControllerRequiresAnimatedHeightChange:(TWTTableViewCellController *)cellController;

@end
