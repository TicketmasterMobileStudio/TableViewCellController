//
//  TWTTableViewSectionController.h
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

@import Foundation;


@class TWTTableViewCellController;

NS_ASSUME_NONNULL_BEGIN

@interface TWTTableViewSectionController : NSObject

/*!
 @abstract The title of the section. Generally speaking, it is up to the class managing the section controller to display the
    section title. Defaults to an empty string.
 */
@property (nonatomic, copy) NSString *sectionTitle;

/*!
 @abstract An array of `TWTTableViewCellController` objects that define the content of the section. Defaults to an empty array.
 */
@property (nonatomic, copy, readonly) NSArray<TWTTableViewCellController *> *cellControllers;

/*!
 @abstract Initializes the section controller with the specified array of cell controllers.
 */
- (instancetype)initWithCellControllers:(NSArray<TWTTableViewCellController *> *)cellControllers NS_DESIGNATED_INITIALIZER;

/*!
 @abstract Initializes the section controller with the specified array of cell controllers and section title.
 */
- (instancetype)initWithCellControllers:(NSArray<TWTTableViewCellController *> *)cellControllers sectionTitle:(NSString *)sectionTitle;

@end

NS_ASSUME_NONNULL_END
