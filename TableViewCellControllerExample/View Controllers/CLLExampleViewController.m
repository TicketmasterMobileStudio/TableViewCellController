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

    NSUInteger limit = 5;

    NSMutableArray *cellControllers = [[NSMutableArray alloc] initWithCapacity:limit];
    for (NSUInteger i = 0; i < limit; i++) {
        CLLColorCellController *cellController = [[CLLColorCellController alloc] init];
        cellController.color = [self nextColor];
        [cellControllers addObject:cellController];
    }

    CLLTableViewSectionController *sectionController1 = [[CLLTableViewSectionController alloc] initWithCellControllers:cellControllers sectionTitle:@"Colors 1"];

    limit = 3;
    cellControllers = [[NSMutableArray alloc] initWithCapacity:limit];
    for (NSUInteger i = 0; i < limit; i++) {
        CLLColorCellController *cellController = [[CLLColorCellController alloc] init];
        cellController.color = [self nextColor];
        [cellControllers addObject:cellController];
    }
    CLLTableViewSectionController *sectionController2 = [[CLLTableViewSectionController alloc] initWithCellControllers:cellControllers sectionTitle:@"Colors 2"];

    CLLTableViewSectionController *sectionController3 = [[CLLTableViewSectionController alloc] initWithCellControllers:@[ [[CLLPrototypeCellController alloc] init] ] sectionTitle:@"Prototypes"];

    self.sectionControllers = @[ sectionController1, sectionController2, sectionController3 ];
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
