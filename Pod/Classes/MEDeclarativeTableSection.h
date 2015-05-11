//
//  MEDeclarativeTableSection.h
//  Pods
//
//  Created by Michael Enriquez on 5/10/15.
//
//

#import <Foundation/Foundation.h>
#import "MEDeclarativeTableRow.h"
@interface MEDeclarativeTableSection : NSObject
@property (nonatomic, strong) NSString *headerTitle;
@property (nonatomic, strong) NSString *footerTitle;
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, assign) CGFloat footerHeight;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *footerView;
- (NSArray *)rows;
- (void)addRow:(MEDeclarativeTableRow *)row;
- (void)setRows:(NSArray *)rows;
- (void)deleteRowAtIndex:(NSUInteger)index;
@end
