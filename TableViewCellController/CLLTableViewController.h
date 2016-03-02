//
//  CLLTableViewController.h
//  TableViewCellController
//
//  Created by Duncan Lewis on 8/10/15.
//  Copyright © 2015 Ticketmaster Entertainment, Inc. All rights reserved.
//

@import UIKit;

#import "CLLTableViewSectionController.h"
#import "CLLTableViewCellController.h"
#import "CLLTableViewCellControllerDelegate.h"


/*!
 PILTableViewController is an abstract class that aims to simplify populating a table view by declaratively specifying the table's
 structure and data ahead of time, rather than by implementing a data source and delegate. Rows and sections in the table are 
 represented by instances of CLLTableViewCellController and CLLTableViewSectionController. Subclasses should set the table view 
 controller's \c sectionControllers property and the table will handle laying out and displaying those items.
 Generally speaking, the \c tableView property can be supplied via Interface Builder or by programatic instantiation. Subclasses 
 may override \c -loadSectionControllers to set \c sectionControllers property, or do it manually. All members of
 \c sectionControllers are assumed to be instances of \c CLLTableViewSectionController or a subclass thereof. Beyond that, the base
 implementation of CLLTableViewController will register nibs and classes for the appropriate cell reuse identifiers; implement
 table view data source and delegate methods; and implement table view cell controller delegate methods.
 */
@interface CLLTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, CLLTableViewCellControllerDelegate>

/*!
 @abstract The receiver’s table view.
 @discussion This property must be set by the time -viewDidLoad is invoked. Failure to do will result in an assertion.
 */
@property (nonatomic, weak) IBOutlet UITableView *tableView;

/*!
 @abstract A boolean value that indicates whether the view controller should automatically adjust the table view's scroll and
    content insets when the keyboard frame changes.
 @discussion NO by default.
 */
@property (nonatomic, assign) BOOL automaticallyAdjustsTableViewInsetsOnKeyboardFrameChange;

/*!
 @abstract An array of CLLTableViewSectionController objects that define the sections of the table view.
 @discussion This array may be set at any time before \c -viewDidLoad is invoked, or during the invocation of
    \c loadSectionControllers. Failure to do so will result in an assertion during -viewDidLoad.
 */
@property (nonatomic, copy) NSArray *sectionControllers;

/*!
 @abstract Initializes the receiver’s \c sectionControllers property.
 @discussion The default implementation does nothing. Subclasses may override this method to initialize the \c sectionControllers 
    property to a non-nil array. The \c loadSectionControllers method is invoked during \c -viewDidLoad - the \c sectionControllers
    array must either be initialized during this method or at some time before \c viewDidLoad is invoked. Failure to do so will 
    result in an assertion during \c -viewDidLoad.
 */
- (void)loadSectionControllers;

@end
