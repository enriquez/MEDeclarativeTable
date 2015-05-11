//
//  MEDeclarativeTableSection.m
//  Pods
//
//  Created by Michael Enriquez on 5/10/15.
//
//

#import "MEDeclarativeTableSection.h"

@interface MEDeclarativeTableSection ()
@property (nonatomic, strong) NSMutableArray *mutableRows;
@end

@implementation MEDeclarativeTableSection

#pragma mark - Public

- (NSArray *)rows
{
    return self.mutableRows;
}

- (void)addRow:(MEDeclarativeTableRow *)row
{
    [self.mutableRows addObject:row];
}

- (void)setRows:(NSArray *)rows
{
    self.mutableRows = [NSMutableArray arrayWithArray:rows];
}

- (void)deleteRowAtIndex:(NSUInteger)index
{
    [self.mutableRows removeObjectAtIndex:index];
}

#pragma mark - Properties

- (NSMutableArray *)mutableRows
{
    if (_mutableRows) return _mutableRows;
    
    _mutableRows = [NSMutableArray array];
    
    return _mutableRows;
}

@end
