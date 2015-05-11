//
//  MEDeclarativeTableRow.m
//  Pods
//
//  Created by Michael Enriquez on 5/10/15.
//
//

#import "MEDeclarativeTableRow.h"

@interface MEDeclarativeTableRow ()
@property (nonatomic, assign) MEDeclarativeTableRowStyle style;
@end

@implementation MEDeclarativeTableRow

#pragma mark - Initializers

+ (instancetype)declarativeTableRowWithStyle:(MEDeclarativeTableRowStyle)style
{
    return [(MEDeclarativeTableRow *)[self alloc] initWithStyle:style];
}

- (instancetype)initWithStyle:(MEDeclarativeTableRowStyle)style
{
    self = [super init];
    if (self) {
        self.height = 44;
        self.style = style;
    }
    
    return self;
}

- (instancetype)init
{
    self = [self initWithStyle:MEDeclarativeTableRowStyleDefault];
    return self;
}

#pragma mark - Properties

- (NSString *)reuseIdentifier
{
    if (_reuseIdentifier) {
        return _reuseIdentifier;
    } else {
        return [[NSUUID UUID] UUIDString];
    }
}

#pragma mark - Public

- (UITableViewCellStyle)cellStyle
{
    switch (self.style) {
        case MEDeclarativeTableRowStyleDefault:
            return UITableViewCellStyleDefault;
        case MEDeclarativeTableRowStyleValue1:
            return UITableViewCellStyleValue1;
        case MEDeclarativeTableRowStyleValue2:
            return UITableViewCellStyleValue2;
        case MEDeclarativeTableRowStyleSubtitle:
            return UITableViewCellStyleSubtitle;
        case MEDeclarativeTableRowStyleCustomView:
            return UITableViewCellStyleDefault;
        default:
            NSAssert(NO, @"invalid style");
    }
}

@end
