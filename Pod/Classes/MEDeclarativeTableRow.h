//
// MEDeclarativeTableRow.h
// MEDeclarativeTable
//
// Copyright (c) 2015, Michael Enriquez (http://enriquez.me)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <Foundation/Foundation.h>

/**
 Row Styles.
 */
typedef NS_ENUM(NSInteger, MEDeclarativeTableRowStyle) {
    /** Creates a table cell with the `UITableViewCellStyleDefault` style */
    MEDeclarativeTableRowStyleDefault,
    /** Creates a table cell with the `UITableViewCellStyleValue1` style */
    MEDeclarativeTableRowStyleValue1,
    /** Creates a table cell with the `UITableViewCellStyleValue2` style */
    MEDeclarativeTableRowStyleValue2,
    /** Creates a table cell with the `UITableViewCellStyleSubtitle` style */
    MEDeclarativeTableRowStyleSubtitle,
    /** Creates a table cell with the intent to add a custom view to it */
    MEDeclarativeTableRowStyleCustomView
};

/**
 `MEDeclarativeTableRow` represents a table row/cell.
 */

@interface MEDeclarativeTableRow : NSObject

/**
 Creates and returns a row with the given `style`.
 
 @param style The style to use for this row.
 
 @return A row with the given style.
 */
+ (instancetype)declarativeTableRowWithStyle:(MEDeclarativeTableRowStyle)style;

/**
 Initializes and returns a newly created row.
 
 @param style The style to use for this row.
 
 @return The initialized row.
 */
- (instancetype)initWithStyle:(MEDeclarativeTableRowStyle)style;

/**
 The `UITableViewCellStyle` used for this row.
 */
- (UITableViewCellStyle)cellStyle;

/**
 The underlying table cell's `reuseIdentifier`. Multiple rows may have the same `reuseIdentifier` if they want to reuse the same table cell. If a `reuseIdentifier` is not set, then a random and unique one will be set causing a new cell to be instantiated for the row.
 */
@property (nonatomic, strong) NSString *reuseIdentifier;

/**
 The underlying table cell's `textLabel.text`.
 */
@property (nonatomic, strong) NSString *textLabelText;

/**
 The underlying table cell's `detailTextLabel.text`.
 */
@property (nonatomic, strong) NSString *detailTextLabelText;

/**
 The underlying table cell's `selectionStyle`.
 */
@property (nonatomic, assign) UITableViewCellSelectionStyle selectionStyle;

/**
 The height of the row in points.
 */
@property (nonatomic, assign) CGFloat height;

/**
 The view to add for rows with the `MEDeclarativeTableRowStyleCustomView` style.
 */
@property (nonatomic, strong) UIView *customView;

/**
 The insets applied to the `customView` relative to the cell. By default, the `customView` will fill the entire cell.
 */
@property (nonatomic, assign) UIEdgeInsets customViewInsets;

/**
 The block to be called when the row's cell is being configured. This is where customization of the underlying cell can be done.
 */
@property (nonatomic, copy) void (^configureCell)(UITableViewCell *cell);

/**
 The block to be called when the cell is swiped to delete is comitted. By setting this block, swipe to delete is automatically enabled.
 */
@property (nonatomic, copy) void (^commitEditingStyle)(UITableViewCellEditingStyle editingStyle, NSIndexPath *indexPath);

/**
 The block to be called when the cell is selected.
 */
@property (nonatomic, copy) void (^didSelectAction)();

@end
