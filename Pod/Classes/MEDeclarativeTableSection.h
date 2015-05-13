//
// MEDeclarativeTableSection.h
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
#import "MEDeclarativeTableRow.h"

/**
  `MEDeclarativeTableSection` represents a table section.
 */

@interface MEDeclarativeTableSection : NSObject

/**
 The text to show in the section header.
 */
@property (nonatomic, strong) NSString *headerTitle;

/**
 The text to show in the section footer.
 */
@property (nonatomic, strong) NSString *footerTitle;

/**
 The height of the section header.
 */
@property (nonatomic, assign) CGFloat headerHeight;

/**
 The height of the section footer.
 */
@property (nonatomic, assign) CGFloat footerHeight;

/**
 The custom view to use for the section header.
 */
@property (nonatomic, strong) UIView *headerView;

/**
 The custom view to use for the section footer.
 */
@property (nonatomic, strong) UIView *footerView;

/**
 The rows in this section.
 */
- (NSArray *)rows;

/**
 Add the row to the existing list of rows.
 
 @param row The row to add to the section
 */
- (void)addRow:(MEDeclarativeTableRow *)row;

/**
 Replaces the current rows with the array of provided rows.
 
 @param rows The rows to replace the existing list of rows.
 */
- (void)setRows:(NSArray *)rows;

/**
 Delete a row from the section.
 
 @param index The index of the row to delete.
 */
- (void)deleteRowAtIndex:(NSUInteger)index;

@end
