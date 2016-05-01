//
//  TWTColorCellController.h
//  TableViewCellController
//
//  Created by Jill Cohen on 3/2/16.
//  Copyright © 2016 Ticketmaster Entertainment, Inc. All rights reserved.
//

#import "TWTTableViewCellController.h"

@interface TWTColorCellController : TWTTableViewCellController

/*! 
 Color is a standin for the model object that this cell controller represents
 The model object would typically be passed to the cell controller as a property. 
 */
@property (nonatomic, strong) UIColor *color;

@end
