//
//  ViewController.m
//  TableViewCellControllerExample
//
//  Created by Duncan Lewis on 8/4/15.
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

#import "TWTExampleViewController.h"

#import "TWTColorCellController.h"


@interface TWTExampleViewController ()

@end

@implementation TWTExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)loadSectionControllers
{
    NSUInteger limit = 5;

    NSMutableArray *cellControllers = [[NSMutableArray alloc] initWithCapacity:limit];
    for (NSUInteger i = 0; i < limit; i++) {
        TWTColorCellController *cellController = [[TWTColorCellController alloc] init];
        [cellControllers addObject:cellController];
    }

    TWTTableViewSectionController *sectionController = [[TWTTableViewSectionController alloc] initWithCellControllers:cellControllers sectionTitle:@"Colors"];

    self.sectionControllers = @[ sectionController ];
}

@end
