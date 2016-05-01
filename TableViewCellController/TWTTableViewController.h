//
//  TWTTableViewController.h
//  TableViewCellController
//
//  Created by Duncan Lewis on 8/10/15.
//  Copyright © 2015 Ticketmaster Entertainment, Inc. All rights reserved.
//

@import UIKit;

#import "TWTTableViewSectionController.h"
#import "TWTTableViewCellController.h"
#import "TWTTableViewCellControllerDelegate.h"


/*!
PILTableViewController is an abstract class that aims to simplify populating a table view by declaratively specifying the table's
structure and data ahead of time, rather than by implementing a data source and delegate. Rows and sections in the table
are represented by instances of TWTTableViewCellController and TWTTableViewSectionController. Subclasses should set the
table view controller's \c sectionControllers property and the table will handle laying out and displaying those items.
Generally speaking, the \c tableView property can be supplied via Interface Builder or by programatic instantiation.
Subclasses may set the \c sectionControllers property during -viewDidLoad. All members of \c sectionControllers are
assumed to be instances of \c TWTTableViewSectionController or a subclass thereof. Beyond that, the base implementation
of TWTTableViewController will register nibs and classes for the appropriate cell reuse identifiers; implement table
view data source and delegate methods; and implement table view cell controller delegate methods.
 */
@interface TWTTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, TWTTableViewCellControllerDelegate>

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
 @abstract An array of TWTTableViewSectionController objects that define the sections of the table view.
 @discussion This array may be set at any time before \c -viewWillAppear is invoked. Failure to do so will result in
 	an assertion during -viewWillAppear.
 */
@property (nonatomic, copy) NSArray<TWTTableViewSectionController *> *sectionControllers;



//- (void)insertCellControllers:(NSArray *)cellControllers atIndexPaths:(NSArray *)indexPaths;
//- (void)insertSectionControllers:(NSArray *)array atIndexes:(NSIndexSet *)indexes;
//- (void)removeCellControllersAtIndexPaths:(NSArray *)indexPaths;
//- (void)removeSectionControllersAtIndexes:(NSIndexSet *)indexes;
//- (void)removeCellControllers:(NSArray<TWTTableViewCellController *> *)cellControllers;
//- (void)removeSectionControllers:(NSArray<TWTTableViewSectionController *> *)sectionContrllers;
//
//- (void)performBatchUpdates:(void (^)(void))updates completion:(void (^)(void))completion;

@end
