//
//  MEAddRemoveExampleViewController.m
//  MEDeclarativeTable
//
//  Created by Michael Enriquez on 5/10/15.
//  Copyright (c) 2015 Mike Enriquez. All rights reserved.
//

#import "MEAddRemoveExampleViewController.h"
#import <MEDeclarativeTable/MEDeclarativeTable.h>

@interface MEAddRemoveExampleViewController ()
@property (nonatomic, strong) UIBarButtonItem *addRowButton;
@property (nonatomic, strong) MEDeclarativeTable *declarativeTable;
@property (nonatomic, strong) MEDeclarativeTableSection *instructionsSection;
@property (nonatomic, strong) MEDeclarativeTableRow *instructionsRow;
@property (nonatomic, strong) UILabel *instructionsLabel;
@property (nonatomic, strong) MEDeclarativeTableSection *dynamicSection;
@property (nonatomic, assign) NSUInteger currentRowNumber;
@end

@implementation MEAddRemoveExampleViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Add/Remove Example";
    
    self.navigationItem.rightBarButtonItem = self.addRowButton;
    
    self.currentRowNumber = 0;
    
    self.tableView.dataSource = self.declarativeTable;
    self.tableView.delegate   = self.declarativeTable;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    CGFloat instructionsLabelWidth = CGRectGetWidth(UIEdgeInsetsInsetRect(self.view.bounds, self.instructionsRow.customViewInsets));
    CGSize instructionsLabelBoundingSize = CGSizeMake(instructionsLabelWidth, CGFLOAT_MAX);
    CGSize instructionsLabelSize = [self.instructionsLabel sizeThatFits:instructionsLabelBoundingSize];
    CGFloat instructionsLabelHeight = instructionsLabelSize.height;
    
    // workaround to handle last line being clipped
    CGSize singleLineSize = [self.instructionsLabel.text sizeWithAttributes:@{ NSFontAttributeName : self.instructionsLabel.font }];
    if (singleLineSize.height != instructionsLabelHeight) {
        instructionsLabelHeight += singleLineSize.height;
    }
    
    self.instructionsRow.height = instructionsLabelHeight + self.instructionsRow.customViewInsets.top + self.instructionsRow.customViewInsets.bottom;
}

#pragma mark - Properties

- (UIBarButtonItem *)addRowButton
{
    if (_addRowButton) return _addRowButton;
    
    _addRowButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                  target:self
                                                                  action:@selector(addRowButtonTapped:)];
    
    return _addRowButton;
}

- (MEDeclarativeTable *)declarativeTable
{
    if (_declarativeTable) return _declarativeTable;
    
    _declarativeTable = [[MEDeclarativeTable alloc] init];
    [_declarativeTable addSection:self.instructionsSection];
    [_declarativeTable addSection:self.dynamicSection];
    
    return _declarativeTable;
}

- (MEDeclarativeTableSection *)instructionsSection
{
    if (_instructionsSection) return _instructionsSection;
    
    _instructionsSection = [[MEDeclarativeTableSection alloc] init];
    [_instructionsSection addRow:self.instructionsRow];
    
    return _instructionsSection;
}

- (MEDeclarativeTableRow *)instructionsRow
{
    if (_instructionsRow) return _instructionsRow;
    
    _instructionsRow = [[MEDeclarativeTableRow alloc] initWithStyle:MEDeclarativeTableRowStyleCustomView];
    _instructionsRow.customView = self.instructionsLabel;
    _instructionsRow.customViewInsets = UIEdgeInsetsMake(0, 20, 0, 20);
    _instructionsRow.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return _instructionsRow;
}

- (UILabel *)instructionsLabel
{
    if (_instructionsLabel) return _instructionsLabel;
    
    _instructionsLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _instructionsLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _instructionsLabel.numberOfLines = 0;
    _instructionsLabel.textAlignment = NSTextAlignmentCenter;
    _instructionsLabel.text = @"Tap the + button in the upper right to add a row. Swipe to delete it.";
    
    return _instructionsLabel;
}

- (MEDeclarativeTableSection *)dynamicSection
{
    if (_dynamicSection) return _dynamicSection;
    
    _dynamicSection = [[MEDeclarativeTableSection alloc] init];
    
    return _dynamicSection;
}

#pragma mark - UIBarButton actions

- (void)addRowButtonTapped:(UIBarButtonItem *)barButtonItem
{
    MEDeclarativeTableRow *dynamicRow = [[MEDeclarativeTableRow alloc] initWithStyle:MEDeclarativeTableRowStyleDefault];
    dynamicRow.textLabelText = [NSString stringWithFormat:@"Row: %lu", (unsigned long)self.currentRowNumber];
    self.currentRowNumber++;
    __weak typeof(self)weakSelf = self;
    dynamicRow.commitEditingStyle = ^(UITableViewCellEditingStyle editingStyle, NSIndexPath *indexPath) {
        if (editingStyle == UITableViewCellEditingStyleDelete) {
            [weakSelf.dynamicSection deleteRowAtIndex:indexPath.row];
            [weakSelf.tableView deleteRowsAtIndexPaths:@[indexPath]
                                      withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    };
    
    [self.dynamicSection addRow:dynamicRow];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.dynamicSection.rows.count-1 inSection:1]] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
