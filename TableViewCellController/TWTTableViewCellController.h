//
//  TWTTableViewCellController.h
//  TableViewCellController
//
//  Created by Duncan Lewis on 8/10/15.
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

@import UIKit;


@protocol TWTTableViewCellControllerDelegate;


/*!
 TWTTableViewCellController is an abstract class that collects data and behavior that is necessary to control an individual table
 view cell.
 
 Subclasses must override the following methods:
 
    * -cellReuseIdentifier
    * -configureCell:
    * -cellHeightForWidth:
    * One of -cellNib or -cellClass, if shouldAutomaticallyRegisterWithTableView returns YES.
 */
@interface TWTTableViewCellController : NSObject

/*! 
 @abstract The cell controller’s delegate.
 */
@property (nonatomic, weak) id<TWTTableViewCellControllerDelegate> delegate;

/*!
 @abstract The cell reuse identifier for the cell controller class.
 @discussion The base implementation returns the name of the cell controller class. Subclasses may override this
 	method to return a custom reuse identifier.
 */
+ (NSString *)cellReuseIdentifier;

/*!
 @abstract The nib for this cell controller’s cell.
 @discussion Subclasses should override this method to return the nib that can be used to register the cell with
 	-[UITableView registerNib:forCellReuseIdentifier:]. Returning nil implies that the cell class should be used for
 	registration instead. Returns nil by default.
 */
+ (UINib *)cellNib;

/*!
 @abstract The class for this cell controller’s cell.
 @discussion Subclasses should override this method to return the class that can be used to register the cell with
 	-[UITableView registerClass:forCellReuseIdentifier:]. Returning nil implies that the cell nib should be used for
 	registration instead. Returns nil by default.
 */
+ (Class)cellClass;

/*!
 @abstract The cell that is being displayed.
 @discussion This should not be subclasses. Instead, subclasses should override willSetCell: and didSetCell: to do
 	any configuration.
 */
@property (nonatomic, weak) UITableViewCell *cell;

/*!
 @abstract Indicates whether the controller should register its cell type with the table view.
 @discussion Default implementation returns YES, indicating that the cell class or nib should be registered with the
 	table view. Return NO in cases where this is handled by other means, e.g. if using prototype cells in a
 	storyboard.
 */
+ (BOOL)shouldAutomaticallyRegisterWithTableView;

/*!
 @abstract The target of the cell controller’s action.
 @discussion This and the corresponding action property are not used internally by cell controllers, though classes
 	that use cell controllers may use them to perform an action at the appropriate time. See PILTableViewController
 	for more information.
 */
@property (nonatomic, weak) id target;

/*!
 @abstract The cell controller’s action.
 @discussion This and the corresponding target property are not used internally by cell controllers, though classes
 	that use cell controllers may use them to perform an action at the appropriate time. Because the action is not
 	used directly, there is no contract regarding the signature of the selector as defined by this class.
 	PILTableViewController and other classes that use cell controllers define the contracts for these selectors. See
 	their documentation for more information.
 */
@property (nonatomic, assign) SEL action;

/*!
 @abstract A configuration point for subclasses to deconfigure the old cell before it stops being displayed.
 @discussion This is invoked during \c -setCell: before the value of \c cell is replaced with the new value. Often, the
 	new value will be nil as the cell is scrolled offscreen. Super must be called, though the default implementation
 	does nothing.
 */
- (void)willSetCell:(UITableViewCell *)newValue __attribute__((objc_requires_super));

/*!
 @abstract A configuration point for subclasses to configure the new cell before it is displayed.
 @discussion This is invoked during \c -setCell: after the value of \c cell is replaced with the new value. Often, the
 	new value will be nil as the cell is scrolled offscreen. Super must be called, though the default implementation
 	does nothing.
 */
- (void)didSetCell:(UITableViewCell *)oldValue __attribute__((objc_requires_super));

/*!
 @abstract Returns the height for the controller’s cell when displayed at the specified width.
 @discussion Subclasses must override this method to return a valid cell height. The base implementation raises an
 	exception.
 @param width The width that the cell will be displayed at.
 @result The cell’s height when displayed at the specified width.
 */
- (CGFloat)cellHeightForWidth:(CGFloat)width;

@end
