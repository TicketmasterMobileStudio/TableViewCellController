//
//  CLLTableViewSectionController.h
//  TableViewCellController
//
//  Created by Duncan Lewis on 8/10/15.
//  Copyright © 2015 Ticketmaster Entertainment, Inc. All rights reserved.
//

@import Foundation;


@class CLLTableViewCellController;

NS_ASSUME_NONNULL_BEGIN

@interface CLLTableViewSectionController : NSObject

/*!
 @abstract The title of the section. Generally speaking, it is up to the class managing the section controller to display the
    section title. Defaults to an empty string.
 */
@property (nonatomic, copy) NSString *sectionTitle;

/*!
 @abstract An array of `CLLTableViewCellController` objects that define the content of the section. Defaults to an empty array.
 */
@property (nonatomic, copy) NSArray *cellControllers;

/*!
 @abstract Initializes the section controller with the specified array of cell controllers.
 */
- (instancetype)initWithCellControllers:(NSArray<CLLTableViewCellController *> *)cellControllers NS_DESIGNATED_INITIALIZER;

/*!
 @abstract Initializes the section controller with the specified array of cell controllers and section title.
 */
- (instancetype)initWithCellControllers:(NSArray<CLLTableViewCellController *> *)cellControllers sectionTitle:(NSString *)sectionTitle;

@end

NS_ASSUME_NONNULL_END
