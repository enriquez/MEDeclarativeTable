//
//  MEDeclarativeTable.m
//  Pods
//
//  Created by Michael Enriquez on 5/10/15.
//
//

#import "MEDeclarativeTable.h"

@interface MEDeclarativeTable ()
@property (nonatomic, strong) NSMutableArray *mutableSections;
@end

@implementation MEDeclarativeTable

#pragma mark - Public

- (void)addSection:(MEDeclarativeTableSection *)section
{
    [self.mutableSections addObject:section];
}

- (void)setSections:(NSArray *)sections
{
    self.mutableSections = [NSMutableArray arrayWithArray:sections];
}

#pragma mark - Properties

- (NSMutableArray *)mutableSections
{
    if (_mutableSections) return _mutableSections;
    
    _mutableSections = [NSMutableArray array];
    
    return _mutableSections;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.mutableSections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    MEDeclarativeTableSection *section = self.mutableSections[sectionIndex];
    return section.rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MEDeclarativeTableSection *section = self.mutableSections[indexPath.section];
    MEDeclarativeTableRow *row = section.rows[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:row.reuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:row.cellStyle
                                      reuseIdentifier:row.reuseIdentifier];
    }
    
    if (row.customView) {
        [cell.contentView addSubview:row.customView];
    } else {
        cell.textLabel.text       = row.textLabelText;
        cell.detailTextLabel.text = row.detailTextLabelText;
    }
    
    cell.selectionStyle = row.selectionStyle;
    
    if (row.configureCell) {
        row.configureCell(cell);
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)sectionIndex
{
    MEDeclarativeTableSection *section = self.mutableSections[sectionIndex];
    if (section.headerTitle) {
        return section.headerTitle;
    } else {
        return nil;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)sectionIndex
{
    MEDeclarativeTableSection *section = self.mutableSections[sectionIndex];
    if (section.footerTitle) {
        return section.footerTitle;
    } else {
        return nil;
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    MEDeclarativeTableSection *section = self.mutableSections[indexPath.section];
    MEDeclarativeTableRow *row = section.rows[indexPath.row];
    if (row.commitEditingStyle) {
        return YES;
    } else {
        return NO;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    MEDeclarativeTableSection *section = self.mutableSections[indexPath.section];
    MEDeclarativeTableRow *row = section.rows[indexPath.row];
    if (row.commitEditingStyle) {
        row.commitEditingStyle(editingStyle, indexPath);
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    MEDeclarativeTableSection *section = self.mutableSections[indexPath.section];
    MEDeclarativeTableRow *row = section.rows[indexPath.row];
    if (row.customView) {
        if (!UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, row.customViewInsets)) {
            row.customView.frame = UIEdgeInsetsInsetRect(cell.contentView.bounds, row.customViewInsets);
        } else {
            row.customView.frame = cell.contentView.bounds;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MEDeclarativeTableSection *section = self.mutableSections[indexPath.section];
    MEDeclarativeTableRow *row = section.rows[indexPath.row];
    return row.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MEDeclarativeTableSection *section = self.mutableSections[indexPath.section];
    MEDeclarativeTableRow *row = section.rows[indexPath.row];
    if (row.didSelectAction) {
        row.didSelectAction();
    }
}

@end
