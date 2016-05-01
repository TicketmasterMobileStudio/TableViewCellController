//
//  TWTTableViewController.m
//  TableViewCellController
//
//  Created by Duncan Lewis on 8/10/15.
//  Copyright © 2015 Ticketmaster Entertainment, Inc. All rights reserved.
//

#import "TWTTableViewController.h"


@interface TWTTableViewController ()

@end


@implementation TWTTableViewController

@synthesize sectionControllers = _sectionControllers;


#pragma mark - Initialization & View Lifecycle

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInitialization];
    }
    return self;
}


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self commonInitialization];
    }
    return self;
}


- (void)commonInitialization
{
    _automaticallyAdjustsTableViewInsetsOnKeyboardFrameChange = YES;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    NSAssert(self.tableView, @"tableView is not initialized");
    self.tableView.dataSource = self;
    self.tableView.delegate = self;


    [self registerTableViewCells];

    [self updateKeyboardNotificationObservation];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    NSAssert(self.sectionControllers, @"sectionControllers is not initialized");
}



- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
}


#pragma mark - Section controllers

//- (NSArray *)sectionControllers
//{
//    if (!_sectionControllers) {
//        [self loadSectionControllers];
//    }
//
//    return _sectionControllers;
//}


- (void)setSectionControllers:(NSArray *)sectionControllers
{
    for (TWTTableViewCellController *cellController in [self allCellControllers]) {
            cellController.cell = nil;
            cellController.delegate = nil;
    }

    [self unregisterTableViewCells];

    _sectionControllers = [sectionControllers copy];

    for (TWTTableViewSectionController *sectionController in _sectionControllers) {
        for (TWTTableViewCellController *cellController in sectionController.cellControllers) {
            cellController.delegate = self;
        }
    }

    [self registerTableViewCells];

    [self.tableView reloadData];
}


- (void)unregisterTableViewCells
{
    NSSet<Class> *cellControllerClasses = [self cellControllerClasses];

    for (Class controllerClass in cellControllerClasses) {
        if ([controllerClass shouldAutomaticallyRegisterWithTableView]) {
            NSString *reuseIdentifier = [controllerClass cellReuseIdentifier];
            NSAssert(reuseIdentifier, @"Reuse identifier for %@ is nil", controllerClass);

            if ([controllerClass cellNib]) {
                [self.tableView registerNib:nil forCellReuseIdentifier:reuseIdentifier];
            } else if ([controllerClass cellClass]) {
                [self.tableView registerClass:nil forCellReuseIdentifier:reuseIdentifier];
            }
        }
    }
}


- (void)registerTableViewCells
{
    NSSet<Class> *cellControllerClasses = [self cellControllerClasses];

    for (Class controllerClass in cellControllerClasses) {
        if ([controllerClass shouldAutomaticallyRegisterWithTableView]) {
            NSString *reuseIdentifier = [controllerClass cellReuseIdentifier];
            NSAssert(reuseIdentifier, @"Reuse identifier for %@ is nil", controllerClass);

            if ([controllerClass cellNib]) {
                [self.tableView registerNib:[controllerClass cellNib] forCellReuseIdentifier:reuseIdentifier];
            } else if ([controllerClass cellClass]) {
                [self.tableView registerClass:[controllerClass cellClass] forCellReuseIdentifier:reuseIdentifier];
            } else {
                NSAssert(NO, @"Nil cell nib and cell class for cell controller class %@", controllerClass);
            }
        }
    }
}


- (NSArray *)allCellControllers
{
    NSArray *controllers = [[NSArray alloc] init];
    for (TWTTableViewSectionController *section in self.sectionControllers) {
        controllers = [controllers arrayByAddingObjectsFromArray:section.cellControllers];
    }

    return controllers;
}


- (NSSet<Class> *)cellControllerClasses
{
    NSMutableSet *cellControllerClasses = [[NSMutableSet alloc] init];
    for (TWTTableViewCellController *cellController in [self allCellControllers]) {
        [cellControllerClasses addObject:[cellController class]];
    }

    return cellControllerClasses;
}


#pragma mark - Keyboard adjustment

- (void)setAutomaticallyAdjustsTableViewInsetsOnKeyboardFrameChange:(BOOL)adjusts
{
    if (_automaticallyAdjustsTableViewInsetsOnKeyboardFrameChange != adjusts) {
        _automaticallyAdjustsTableViewInsetsOnKeyboardFrameChange = adjusts;
        [self updateKeyboardNotificationObservation];
    }
}


- (void)updateKeyboardNotificationObservation
{
    if (self.automaticallyAdjustsScrollViewInsets) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillChangeFrame:)
                                                     name:UIKeyboardWillChangeFrameNotification
                                                   object:nil];
    } else {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    }
}


- (void)keyboardWillChangeFrame:(NSNotification *)notification
{
    if (!self.isViewLoaded || !self.view.window) {
        return;
    }

    CGRect keyboardFrameEndInScreenCoordinates = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect keyboardFrameInWindowCoordinates = [self.view.window convertRect:keyboardFrameEndInScreenCoordinates fromWindow:nil];
    CGRect keyboardFrameInViewCoordinates = [self.view convertRect:keyboardFrameInWindowCoordinates fromView:self.view.window];
    CGRect keyboardFrameOnScreen = CGRectIntersection(self.view.bounds, keyboardFrameInViewCoordinates);

    UIEdgeInsets contentInset = self.tableView.contentInset;
    contentInset.bottom = keyboardFrameOnScreen.size.height;
    self.tableView.contentInset = contentInset;

    UIEdgeInsets scrollIndicatorInsets = self.tableView.scrollIndicatorInsets;
    scrollIndicatorInsets.bottom = keyboardFrameOnScreen.size.height;
    self.tableView.scrollIndicatorInsets = scrollIndicatorInsets;
}


#pragma mark - Table View

- (TWTTableViewCellController *)cellControllerForIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section < self.sectionControllers.count) {
        TWTTableViewSectionController *sectionController = self.sectionControllers[indexPath.section];
        if (indexPath.row < sectionController.cellControllers.count) {
            return sectionController.cellControllers[indexPath.row];
        }
    }

    return nil;
}


- (NSIndexPath *)indexPathForCellController:(TWTTableViewCellController *)cellController
{
    __block NSIndexPath *indexPath = nil;

    [self.sectionControllers enumerateObjectsUsingBlock:^(TWTTableViewSectionController *sectionController, NSUInteger idx, BOOL *stop) {
        NSInteger row = [sectionController.cellControllers indexOfObjectIdenticalTo:cellController];

        if (row != NSNotFound) {
            NSInteger section = idx;
            indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            *stop = YES;
        }
    }];

    return indexPath;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionControllers.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section >= self.sectionControllers.count) {
        return 0;
    }

    TWTTableViewSectionController *sectionController = self.sectionControllers[section];
    return sectionController.cellControllers.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TWTTableViewCellController *cellController = [self cellControllerForIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[cellController.class cellReuseIdentifier] forIndexPath:indexPath];
    cellController.cell = cell;
    return cell;
}


//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    TWTTableViewCellController *cellController = [self cellControllerForIndexPath:indexPath];
//    [cellController beginDisplayingCell:cell inTableView:tableView];
//}


- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    TWTTableViewCellController *cellController = [self cellControllerForIndexPath:indexPath];
    if (cellController.cell == cell) {
        cellController.cell = nil;
//        [cellController endDisplayingCell:cell inTableView:tableView];
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TWTTableViewCellController *cellController = [self cellControllerForIndexPath:indexPath];
    return [cellController cellHeightForWidth:CGRectGetWidth(tableView.bounds)];
}


- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    TWTTableViewCellController *cellController = [self cellControllerForIndexPath:indexPath];
    return cellController.target && cellController.action;
}


- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TWTTableViewCellController *cellController = [self cellControllerForIndexPath:indexPath];
    return cellController.target && cellController.action ? indexPath : nil;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSMethodSignature *noArgumentSignature = nil;
    static NSMethodSignature *senderSignature = nil;
    static NSMethodSignature *senderIndexPathSignature = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        noArgumentSignature = [self methodSignatureForSelector:@selector(selectTableViewCellNoArgumentSelector)];
        senderSignature = [self methodSignatureForSelector:@selector(selectTableViewCellSenderSelector:)];
        senderIndexPathSignature = [self methodSignatureForSelector:@selector(selectTableViewCellSender:indexPathSelector:)];
    });

    TWTTableViewCellController *cellController = [self cellControllerForIndexPath:indexPath];
    if (cellController.target && cellController.action) {
        NSMethodSignature *signature = [cellController.target methodSignatureForSelector:cellController.action];

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        if ([signature isEqual:noArgumentSignature]) {
            [cellController.target performSelector:cellController.action];
        } else if ([signature isEqual:senderSignature]) {
            [cellController.target performSelector:cellController.action withObject:cellController];
        } else if ([signature isEqual:senderIndexPathSignature]) {
            [cellController.target performSelector:cellController.action withObject:cellController withObject:indexPath];
        } else {
            NSAssert(NO, @"selector (%@) is not a valid action signature", NSStringFromSelector(cellController.action));
        }
#pragma clang diagnostic pop
    }
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    TWTTableViewSectionController *sectionController = self.sectionControllers[section];
    return sectionController.sectionTitle;
}


- (void)selectTableViewCellNoArgumentSelector
{
    // Intentionally empty. Used for determining which version of perform selector we should use in
    // ‑tableView:didSelectRowAtIndexPath:.
}


- (void)selectTableViewCellSenderSelector:(id)sender
{
    // Intentionally empty. Used for determining which version of perform selector we should use in
    // ‑tableView:didSelectRowAtIndexPath:.
}


- (void)selectTableViewCellSender:(id)sender indexPathSelector:(NSIndexPath *)indexPath
{
    // Intentionally empty. Used for determining which version of perform selector we should use in
    // ‑tableView:didSelectRowAtIndexPath:.
}


#pragma mark - Table View Cell Controller Delegate

- (void)cellControllerRequiresReload:(TWTTableViewCellController *)cellController
{
    [self.tableView reloadRowsAtIndexPaths:@[ [self indexPathForCellController:cellController] ]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
}


- (void)cellControllerRequiresAnimatedHeightChange:(TWTTableViewCellController *)cellController
{
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
    } completion:nil];
}

@end
