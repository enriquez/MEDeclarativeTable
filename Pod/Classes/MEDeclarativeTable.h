//
// MEDeclarativeTable.h
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

#import <UIKit/UIKit.h>
#import "MEDeclarativeTableSection.h"
#import "MEDeclarativeTableRow.h"

/**
 Describe the structure of your `UITableView`'s sections and rows in an object oriented way. Useful for building small and mostly static tables such as forms, settings, menus, etc... We prefer readability over memory efficiency, so it is not recommended to use this with tables that may have a large number of cells.
 
 Changes to the sections or rows will need a call to a table view's `reloadData` (or similar method to refresh the table) to see the changes go into effect.
 */

@interface MEDeclarativeTable : NSObject <UITableViewDataSource, UITableViewDelegate>

/**
 Add the section to the existing list of sections.
 
 @param section The section to add to the table
 */
- (void)addSection:(MEDeclarativeTableSection *)section;

/**
 Replaces the current sections with the array of provided sections.
 
 @param sections The sections to replace the existing list of sections.
 */
- (void)setSections:(NSArray *)sections;

@end
