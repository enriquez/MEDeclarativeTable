//
//  MEBasicExampleViewController.m
//  MEDeclarativeTable
//
//  Created by Michael Enriquez on 5/10/15.
//  Copyright (c) 2015 Mike Enriquez. All rights reserved.
//

#import "MEBasicExampleViewController.h"
#import <MEDeclarativeTable/MEDeclarativeTable.h>

@interface MEBasicExampleViewController ()
@property (nonatomic, strong) MEDeclarativeTable *declarativeTable;
@property (nonatomic, strong) MEDeclarativeTableSection *contactDetailSection;
@property (nonatomic, strong) MEDeclarativeTableRow *firstNameRow;
@property (nonatomic, strong) MEDeclarativeTableRow *lastNameRow;
@property (nonatomic, strong) MEDeclarativeTableRow *emailRow;
@property (nonatomic, strong) MEDeclarativeTableSection *buttonSection;
@property (nonatomic, strong) MEDeclarativeTableRow *deleteContactRow;
@end

@implementation MEBasicExampleViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Basic Example";
    
    self.firstNameRow.detailTextLabelText = @"Mike";
    self.lastNameRow.detailTextLabelText  = @"Enriquez";
    self.emailRow.detailTextLabelText     = @"mike@enriquez.me";
    
    self.tableView.dataSource = self.declarativeTable;
    self.tableView.delegate   = self.declarativeTable;
}

#pragma mark - Properties

- (MEDeclarativeTable *)declarativeTable
{
    if (_declarativeTable) return _declarativeTable;
    
    _declarativeTable = [[MEDeclarativeTable alloc] init];
    [_declarativeTable setSections:@[ self.contactDetailSection, self.buttonSection ]];
    
    return _declarativeTable;
}

- (MEDeclarativeTableSection *)contactDetailSection
{
    if (_contactDetailSection) return _contactDetailSection;
    
    _contactDetailSection = [[MEDeclarativeTableSection alloc] init];
    _contactDetailSection.headerTitle = @"Contact Details";
    [_contactDetailSection setRows:@[self.firstNameRow,
                                     self.lastNameRow,
                                     self.emailRow]];
    
    return _contactDetailSection;
}

- (MEDeclarativeTableRow *)firstNameRow
{
    if (_firstNameRow) return _firstNameRow;
    
    _firstNameRow = [[MEDeclarativeTableRow alloc] initWithStyle:MEDeclarativeTableRowStyleValue2];
    _firstNameRow.reuseIdentifier = @"ContactDetailCell";
    _firstNameRow.selectionStyle = UITableViewCellSelectionStyleNone;
    _firstNameRow.textLabelText = @"First Name";
    
    return _firstNameRow;
}

- (MEDeclarativeTableRow *)lastNameRow
{
    if (_lastNameRow) return _lastNameRow;
    
    _lastNameRow = [[MEDeclarativeTableRow alloc] initWithStyle:MEDeclarativeTableRowStyleValue2];
    _lastNameRow.reuseIdentifier = @"ContactDetailCell";
    _lastNameRow.selectionStyle = UITableViewCellSelectionStyleNone;
    _lastNameRow.textLabelText = @"Last Name";
    
    return _lastNameRow;
}

- (MEDeclarativeTableRow *)emailRow
{
    if (_emailRow) return _emailRow;
    
    _emailRow = [[MEDeclarativeTableRow alloc] initWithStyle:MEDeclarativeTableRowStyleValue2];
    _emailRow.reuseIdentifier = @"ContactDetailCell";
    _emailRow.selectionStyle = UITableViewCellSelectionStyleNone;
    _emailRow.textLabelText = @"Email";
    
    return _emailRow;
}

- (MEDeclarativeTableSection *)buttonSection
{
    if (_buttonSection) return _buttonSection;
    
    _buttonSection = [[MEDeclarativeTableSection alloc] init];
    [_buttonSection setRows:@[ self.deleteContactRow ]];
    
    return _buttonSection;
}

- (MEDeclarativeTableRow *)deleteContactRow
{
    if (_deleteContactRow) return _deleteContactRow;
    
    _deleteContactRow = [[MEDeclarativeTableRow alloc] initWithStyle:MEDeclarativeTableRowStyleDefault];
    _deleteContactRow.textLabelText = @"Delete Contact";
    _deleteContactRow.selectionStyle = UITableViewCellSelectionStyleNone;
    _deleteContactRow.configureCell = ^(UITableViewCell *cell) {
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.textColor     = [UIColor redColor];
    };
    
    _deleteContactRow.didSelectAction = ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Delete Contact Tapped"
                                                        message:@"This doesn't actually do anything. It's an example."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    };
    
    return _deleteContactRow;
}

@end
