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

#import "TWTExampleViewController.h"

#import "TWTColorCellController.h"
#import "TWTPrototypeCellController.h"


@interface TWTExampleViewController ()

@end


@implementation TWTExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.sectionControllers = @[ [self newPrototypeSection], [self newColorSection] ];
}


#pragma mark - Actions

- (IBAction)addSectionController
{
    self.sectionControllers = [self.sectionControllers arrayByAddingObject:[self newColorSection]];
}


- (IBAction)removeSectionController
{
    if (self.sectionControllers.count == 0) {
        return;
    }

    NSMutableArray *newSectionControllers = [self.sectionControllers mutableCopy];
    [newSectionControllers removeLastObject];
    self.sectionControllers = newSectionControllers;
}


#pragma mark - Helpers

- (TWTTableViewSectionController *)newColorSection
{
    NSUInteger limit = random() % 6;

    NSMutableArray *cellControllers = [[NSMutableArray alloc] initWithCapacity:limit];
    for (NSUInteger i = 0; i < limit; i++) {
        TWTColorCellController *cellController = [[TWTColorCellController alloc] init];
        cellController.color = [self nextColor];
        [cellControllers addObject:cellController];
    }

    static NSUInteger sectionNumber = 0;
    sectionNumber++;
    NSString *sectionTitle = [NSString stringWithFormat:@"Colors %lu", (unsigned long)sectionNumber];

    return [[TWTTableViewSectionController alloc] initWithCellControllers:cellControllers sectionTitle:sectionTitle];
}


- (TWTTableViewSectionController *)newPrototypeSection
{
    return [[TWTTableViewSectionController alloc] initWithCellControllers:@[ [[TWTPrototypeCellController alloc] init] ] sectionTitle:@"Prototypes"];
}


- (UIColor *)nextColor
{
    static NSArray *rainbow;
    static NSUInteger counter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rainbow = @[ [UIColor redColor],
                     [UIColor orangeColor],
                     [UIColor yellowColor],
                     [UIColor greenColor],
                     [UIColor cyanColor],
                     [UIColor blueColor],
                     [UIColor purpleColor],
                     [UIColor magentaColor] ];

        counter = 0;
    });

    if (counter >= rainbow.count) {
        counter = 0;
    }

    return rainbow[counter++];
}

@end
