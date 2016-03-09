//
//  ViewController.m
//  TableViewCellControllerExample
//
//  Created by Duncan Lewis on 8/4/15.
//  Copyright (c) 2015 Ticketmaster Entertainment, Inc. All rights reserved.
//

#import "CLLExampleViewController.h"

#import "CLLColorCellController.h"
#import "CLLPrototypeCellController.h"


@interface CLLExampleViewController ()

@end


@implementation CLLExampleViewController

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

- (CLLTableViewSectionController *)newColorSection
{
    NSUInteger limit = random() % 6;

    NSMutableArray *cellControllers = [[NSMutableArray alloc] initWithCapacity:limit];
    for (NSUInteger i = 0; i < limit; i++) {
        CLLColorCellController *cellController = [[CLLColorCellController alloc] init];
        cellController.color = [self nextColor];
        [cellControllers addObject:cellController];
    }

    static NSUInteger sectionNumber = 0;
    sectionNumber++;
    NSString *sectionTitle = [NSString stringWithFormat:@"Colors %lu", (unsigned long)sectionNumber];

    return [[CLLTableViewSectionController alloc] initWithCellControllers:cellControllers sectionTitle:sectionTitle];
}


- (CLLTableViewSectionController *)newPrototypeSection
{
    return [[CLLTableViewSectionController alloc] initWithCellControllers:@[ [[CLLPrototypeCellController alloc] init] ] sectionTitle:@"Prototypes"];
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
