//
//  CLLTableViewCellController.h
//  TableViewCellController
//
//  Created by Duncan Lewis on 8/10/15.
//  Copyright © 2015 Ticketmaster Entertainment, Inc. All rights reserved.
//

@import UIKit;


@protocol CLLTableViewCellControllerDelegate;


/*!
 CLLTableViewCellController is an abstract class that collects data and behavior that is necessary to control an individual table
 view cell.
 
 Subclasses must override the following methods:
 
    * -cellReuseIdentifier
    * -configureCell:
    * -cellHeightForWidth:
    * One of -cellNib or -cellClass, if shouldAutomaticallyRegisterWithTableView returns YES.
 */
@interface CLLTableViewCellController : NSObject

/*! The cell controller’s delegate. */
@property (nonatomic, weak) id<CLLTableViewCellControllerDelegate> delegate;

/*!
 @abstract The cell reuse identifier for the cell controller.
 @discussion Subclasses must override this method to return a valid reuse identifier. The base implementation
 raises an exception.
 */
@property (nonatomic, copy, readonly) NSString *cellReuseIdentifier;

/*!
 @abstract The nib for this cell controller’s cell.
 @discussion Subclasses should override this method to return the nib that can be used to register the cell with
 -[UITableView registerNib:forCellReuseIdentifier:]. Returning nil implies that the cell class should be used
 for registration instead. Returns nil by default.
 */
@property (nonatomic, strong, readonly) UINib *cellNib;

/*!
 @abstract The class for this cell controller’s cell.
 @discussion Subclasses should override this method to return the class that can be used to register the cell
 with -[UITableView registerClass:forCellReuseIdentifier:]. Returning nil implies that the cell nib should
 be used for registration instead. Returns nil by default.
 */
@property (nonatomic, strong, readonly) Class cellClass;

/*!
 @abstract Indicates whether the controller should register its cell type with the table view.
 @discussion Default implementation returns YES, indicating that the cell class or nib should be registered
 with the table view. Return NO in cases where this is handled by other means, e.g. if using prototype cells in a storyboard.
 */
- (BOOL)shouldAutomaticallyRegisterWithTableView;

/*!
 @abstract The target of the cell controller’s action.
 @discussion This and the corresponding action property are not used internally by cell controllers, though
 classes that use cell controllers may use them to perform an action at the appropriate time. See
 PILTableViewController for more information.
 */
@property (nonatomic, weak) id target;

/*!
 @abstract The cell controller’s action.
 @discussion This and the corresponding target property are not used internally by cell controllers, though
 classes that use cell controllers may use them to perform an action at the appropriate time. Because the
 action is not used directly, there is no contract regarding the signature of the selector as defined by
 this class. PILTableViewController and other classes that use cell controllers define the contracts for
 these selectors. See their documentation for more information.
 */
@property (nonatomic, assign) SEL action;

/*!
 @abstract Configures the specified cell.
 @discussion Subclasses must override this method to configure a cell with the appropriate data. The base
 implementation sets the cell’s separatorInset and layoutMargins.
 @param cell The cell to configure.
 */
- (void)configureCell:(UITableViewCell *)cell __attribute__((objc_requires_super));

/*!
 @abstract Invoked to indicate that a cell is being displayed.
 @discussion Subclasses can override this method to perform any special actions when a cell begins being displayed.
 The base implementation sets the receiver’s cell and tableView properties. Subclasses must invoke the superclass
 implementation.
 @param cell The cell instance being displayed.
 @param tableView The table view in which the cell is being displayed.
 */
- (void)beginDisplayingCell:(UITableViewCell *)cell
                inTableView:(UITableView *)tableView __attribute__((objc_requires_super));

/*!
 @abstract Invoked to indicate that a cell is no longer being displayed.
 @discussion Subclasses can override this method to perform any special actions when a cell stops being displayed.
 The base implementation sets the receiver’s cell and tableView properties to nil. Subclasses must invoke the
 superclass implementation.
 @param cell The cell instance no longer being displayed.
 @param tableView The table view in which the cell was being displayed.
 */
- (void)endDisplayingCell:(UITableViewCell *)cell
              inTableView:(UITableView *)tableView __attribute__((objc_requires_super));

/*!
 @abstract Returns the height for the controller’s cell when displayed at the specified width.
 @discussion Subclasses must override this method to return a valid cell height. The base implementation raises an
 exception.
 @param width The width that the cell will be displayed at.
 @result The cell’s height when displayed at the specified width.
 */
- (CGFloat)cellHeightForWidth:(CGFloat)width;

/*!
 @abstract Notifies the receiver that its cell is about to become first responder in its window.
 @discussion The default implementation returns YES and invokes ‑cellControllerDidBecomeFirstResponder: on the delegate.
 Subclasses should override this method to send -becomeFirstResponder to the appropriate subview of the cell and
 return the result of that message send.
 @result Whether the receiver accepts first responder status.
 */
- (BOOL)becomeFirstResponder;

/*!
 @abstract Notifies the receiver that its cell has been asked to relinquish its status as first responder in its window.
 @discussion The default implementation returns YES and invokes ‑cellControllerDidResignFirstResponder: on the delegate.
 Subclasses should override this method to send -resignFirstResponder to the appropriate subview of the cell and
 return the result of that message send. Should resignation succeed, the subclass should invoke the aforementioned
 delegate message.
 @result Whether the receiver relinquishes first responder status.
 */
- (BOOL)resignFirstResponder;

@end
