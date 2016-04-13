//
//  TWTTableViewCellControllerDelegate.h
//  TableViewCellController
//
//  Created by Duncan Lewis on 8/11/15.
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


@optional

/*!
 @abstract Invoked when the cell controller’s cell becomes first responder.
 @discussion Every effort should be made to recognize and respond to this condition. However, it may not always be
 possible. For example, if a subview of the cell becomes first responder and does not provide a mechanism for
 notifying that it has done so, the cell controller may not be able to reliably reflect the change in first
 responder status. Cell controller classes should be explicit about this.
 @param cellController The cell controller whose cell resigned first responder.
 */
- (void)cellControllerDidBecomeFirstResponder:(TWTTableViewCellController *)cellController;

/*!
 @abstract Invoked when the cell controller’s cell resigns first responder.
 @discussion Every effort should be made to recognize and respond to this condition. However, it may not always be
 possible. For example, if a subview of the cell resigns first responder and does not provide a mechanism for
 notifying that it has resigned first responder, the cell controller may not be able to reliably reflect the
 change in first responder status. Cell controller classes should be explicit about this.
 @param cellController The cell controller whose cell resigned first responder.
 */
- (void)cellControllerDidResignFirstResponder:(TWTTableViewCellController *)cellController;

@end
