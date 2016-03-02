//
//  ViewController.m
//  TableViewCellControllerExample
//
//  Created by Duncan Lewis on 8/4/15.
//  Copyright (c) 2015 Ticketmaster Entertainment, Inc. All rights reserved.
//

#import "CLLExampleViewController.h"

#import "CLLColorCellController.h"


@interface CLLExampleViewController ()

@end

@implementation CLLExampleViewController

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
        CLLColorCellController *cellController = [[CLLColorCellController alloc] init];
        [cellControllers addObject:cellController];
    }

    CLLTableViewSectionController *sectionController = [[CLLTableViewSectionController alloc] initWithCellControllers:cellControllers sectionTitle:@"Colors"];

    self.sectionControllers = @[ sectionController ];
}

@end
