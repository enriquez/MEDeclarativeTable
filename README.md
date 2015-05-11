# MEDeclarativeTable

Describe the structure of your `UITableView`'s sections and rows in an object oriented way.  Useful for building small and mostly static tables such as forms, settings, menus, etc...  We prefer readability over memory efficiency, so it is not recommended to use this with tables that may have a large number of cells.

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Getting Started

`MEDeclarativeTable` acts as a `UITableViewDataSource` and `UITableViewDelegate` for your `UITableView`.  Once setup, you configure your sections and rows through `MEDeclarativeTable`.

### Setup

Create an `MEDeclarativeTable` instance and set it as the table's data source and delegate.

```objc
MEDeclarativeTable *declarativeTable = [[MEDeclarativeTable alloc] init];
self.tableView.dataSource = declarativeTable;
self.tableView.delegate   = declarativeTable;
```

### Table Sections

All tables need at least one section.  Sections are represented by the `MEDeclarativeTableSection` class.

```objc
MEDeclarativeTableSection *section = [[MEDeclarativeTableSection alloc] init];
```

From here, you can configure the section's header and footer.  The example below sets the header title.  See `MEDeclarativeTableSection.h` for more options.

```objc
section.headerTitle  = @"Section Title";
```

Add the section to the table.

```objc
[declarativeTable addSection:section];
```

### Table Rows

Now that we have a section, we can create some rows and add them to it.  The following example creates three rows.

```objc
MEDeclarativeTableRow *nameRow = [MEDeclarativeTableRow alloc] initWithStyle:MEDeclarativeTableRowStyleValue2];
nameRow.textLabelText          = @"Name";
nameRow.detailTextLabelText    = @"Mike Enriquez";

MEDeclarativeTableRow *emailRow = [MEDeclarativeTableRow alloc] initWithStyle:MEDeclarativeTableRowStyleValue2];
emailRow.textLabelText          = @"Email";
emailRow.detailTextLabelText    = @"mike@enriquez.me";

MEDeclarativeTableRow *deleteRow = [MEDeclarativeTableRow alloc] init];
deleteRow.textLabelText          = @"Delete Contact";
deleteRow.configureCell = ^(UITableViewCell *cell) {
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor     = [UIColor redColor];
};
deleteRow.didSelectAction = ^() {
    NSLog(@"TODO: Delete Contact tapped");
};

[section setRows:@[ nameRow, emailRow, deleteRow ]];
```

A row can contain a custom view.  Use the `MEDeclarativeTableRowStyleCustomView` style and set `customView`.  The row's height will automatically be set based on the height of the custom view.

```objc
MEDeclarativeTableRow *row = [MEDeclarativeTableRow alloc] initWithStyle:MEDeclarativeTableRowStyleCustomView];
row.customView = self.myCustomView;

[section addRow:row];
```

## Installation

MEDeclarativeTable is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MEDeclarativeTable"
```

## License

MEDeclarativeTable is available under the MIT license. See the LICENSE file for more info.
