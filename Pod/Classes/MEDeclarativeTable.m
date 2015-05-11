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
- (MEDeclarativeTableSection *)sectionAtIndex:(NSInteger)index;
- (MEDeclarativeTableRow *)rowAtIndexPath:(NSIndexPath *)indexPath;
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
    MEDeclarativeTableSection *section = [self sectionAtIndex:sectionIndex];
    return section.rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MEDeclarativeTableRow *row = [self rowAtIndexPath:indexPath];
    
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
    MEDeclarativeTableSection *section = [self sectionAtIndex:sectionIndex];
    if (section.headerTitle) {
        return section.headerTitle;
    } else {
        return nil;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)sectionIndex
{
    MEDeclarativeTableSection *section = [self sectionAtIndex:sectionIndex];
    if (section.footerTitle) {
        return section.footerTitle;
    } else {
        return nil;
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    MEDeclarativeTableRow *row = [self rowAtIndexPath:indexPath];
    if (row.commitEditingStyle) {
        return YES;
    } else {
        return NO;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    MEDeclarativeTableRow *row = [self rowAtIndexPath:indexPath];
    if (row.commitEditingStyle) {
        row.commitEditingStyle(editingStyle, indexPath);
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    MEDeclarativeTableRow *row = [self rowAtIndexPath:indexPath];
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
    MEDeclarativeTableRow *row = [self rowAtIndexPath:indexPath];
    return row.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MEDeclarativeTableRow *row = [self rowAtIndexPath:indexPath];
    if (row.didSelectAction) {
        row.didSelectAction();
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    MEDeclarativeTableSection *section = [self sectionAtIndex:sectionIndex];
    if (section.headerView) {
        return CGRectGetHeight(section.headerView.bounds);
    } else if (section.headerHeight > 0) {
        return section.headerHeight;
    } else {
        return UITableViewAutomaticDimension;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)sectionIndex
{
    MEDeclarativeTableSection *section = [self sectionAtIndex:sectionIndex];
    if (section.footerView) {
        return CGRectGetHeight(section.footerView.bounds);
    } else if (section.footerHeight > 0) {
        return section.footerHeight;
    } else {
        return UITableViewAutomaticDimension;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex
{
    MEDeclarativeTableSection *section = [self sectionAtIndex:sectionIndex];
    if (section.headerView) {
        return section.headerView;
    } else {
        return nil;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)sectionIndex
{
    MEDeclarativeTableSection *section = [self sectionAtIndex:sectionIndex];
    if (section.footerView) {
        return section.footerView;
    } else {
        return nil;
    }
}

#pragma mark - Private

- (MEDeclarativeTableSection *)sectionAtIndex:(NSInteger)index
{
    return self.mutableSections[index];
}

- (MEDeclarativeTableRow *)rowAtIndexPath:(NSIndexPath *)indexPath
{
    MEDeclarativeTableSection *section = self.mutableSections[indexPath.section];
    return section.rows[indexPath.row];
}

@end
