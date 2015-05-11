//
//  MEExamplesViewController.m
//  MEDeclarativeTable
//
//  Created by Michael Enriquez on 5/10/15.
//  Copyright (c) 2015 Mike Enriquez. All rights reserved.
//

#import "MEExamplesViewController.h"
#import "MEBasicExampleViewController.h"
#import "MEAddRemoveExampleViewController.h"
#import <MEDeclarativeTable/MEDeclarativeTable.h>

@interface MEExamplesViewController ()
@property (nonatomic, strong) MEDeclarativeTable *declarativeTable;
@property (nonatomic, strong) MEDeclarativeTableSection *examplesSection;
@property (nonatomic, strong) MEDeclarativeTableRow *basicExampleRow;
@property (nonatomic, strong) MEDeclarativeTableRow *addRemoveExampleRow;
@end

@implementation MEExamplesViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Examples";
    
    self.tableView.dataSource = self.declarativeTable;
    self.tableView.delegate   = self.declarativeTable;
}

#pragma mark - Properties

- (MEDeclarativeTable *)declarativeTable
{
    if (_declarativeTable) return _declarativeTable;
    
    _declarativeTable = [[MEDeclarativeTable alloc] init];
    [_declarativeTable addSection:self.examplesSection];
    
    return _declarativeTable;
}

- (MEDeclarativeTableSection *)examplesSection
{
    if (_examplesSection) return _examplesSection;
    
    _examplesSection = [[MEDeclarativeTableSection alloc] init];
    _examplesSection.footerTitle = @"MEDeclarativeTable";
    [_examplesSection addRow:self.basicExampleRow];
    [_examplesSection addRow:self.addRemoveExampleRow];
    
    return _examplesSection;
}

- (MEDeclarativeTableRow *)basicExampleRow
{
    if (_basicExampleRow) return _basicExampleRow;
    
    _basicExampleRow = [[MEDeclarativeTableRow alloc] init];
    _basicExampleRow.reuseIdentifier = @"ExampleCell";
    _basicExampleRow.textLabelText = @"Basic Example";
    _basicExampleRow.configureCell = ^(UITableViewCell *cell) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    };
    __weak typeof(self)weakSelf = self;
    _basicExampleRow.didSelectAction = ^{
        MEBasicExampleViewController *basicExampleViewController = [[MEBasicExampleViewController alloc] initWithStyle:UITableViewStyleGrouped];
        [weakSelf.navigationController pushViewController:basicExampleViewController
                                                 animated:YES];
    };
    
    return _basicExampleRow;
}

- (MEDeclarativeTableRow *)addRemoveExampleRow
{
    if (_addRemoveExampleRow) return _addRemoveExampleRow;
    
    _addRemoveExampleRow = [[MEDeclarativeTableRow alloc] init];
    _addRemoveExampleRow.reuseIdentifier = @"ExampleCell";
    _addRemoveExampleRow.textLabelText = @"Add/Remove Example";
    _addRemoveExampleRow.configureCell = ^(UITableViewCell *cell) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    };
    __weak typeof(self)weakSelf = self;
    _addRemoveExampleRow.didSelectAction = ^{
        MEAddRemoveExampleViewController *addRemoveViewController = [[MEAddRemoveExampleViewController alloc] initWithStyle:UITableViewStyleGrouped];
        [weakSelf.navigationController pushViewController:addRemoveViewController
                                                 animated:YES];
    };
    
    return _addRemoveExampleRow;
}

@end
