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


@optional

/*!
 @abstract Invoked when the cell controller’s cell becomes first responder.
 @discussion Every effort should be made to recognize and respond to this condition. However, it may not always be
 possible. For example, if a subview of the cell becomes first responder and does not provide a mechanism for
 notifying that it has done so, the cell controller may not be able to reliably reflect the change in first
 responder status. Cell controller classes should be explicit about this.
 @param cellController The cell controller whose cell resigned first responder.
 */
- (void)cellControllerDidBecomeFirstResponder:(CLLTableViewCellController *)cellController;

/*!
 @abstract Invoked when the cell controller’s cell resigns first responder.
 @discussion Every effort should be made to recognize and respond to this condition. However, it may not always be
 possible. For example, if a subview of the cell resigns first responder and does not provide a mechanism for
 notifying that it has resigned first responder, the cell controller may not be able to reliably reflect the
 change in first responder status. Cell controller classes should be explicit about this.
 @param cellController The cell controller whose cell resigned first responder.
 */
- (void)cellControllerDidResignFirstResponder:(CLLTableViewCellController *)cellController;

@end
