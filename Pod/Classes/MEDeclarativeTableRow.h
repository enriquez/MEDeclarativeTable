//
//  MEDeclarativeTableRow.h
//  Pods
//
//  Created by Michael Enriquez on 5/10/15.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MEDeclarativeTableRowStyle) {
    MEDeclarativeTableRowStyleDefault,
    MEDeclarativeTableRowStyleValue1,
    MEDeclarativeTableRowStyleValue2,
    MEDeclarativeTableRowStyleSubtitle,
    MEDeclarativeTableRowStyleCustomView
};

@interface MEDeclarativeTableRow : NSObject
+ (instancetype)declarativeTableRowWithStyle:(MEDeclarativeTableRowStyle)style;
- (instancetype)initWithStyle:(MEDeclarativeTableRowStyle)style;
- (UITableViewCellStyle)cellStyle;
@property (nonatomic, strong) NSString *reuseIdentifier;
@property (nonatomic, strong) NSString *textLabelText;
@property (nonatomic, strong) NSString *detailTextLabelText;
@property (nonatomic, assign) UITableViewCellSelectionStyle selectionStyle;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, strong) UIView *customView;
@property (nonatomic, assign) UIEdgeInsets customViewInsets;
@property (nonatomic, copy) void (^configureCell)(UITableViewCell *cell);
@property (nonatomic, copy) void (^commitEditingStyle)(UITableViewCellEditingStyle editingStyle, NSIndexPath *indexPath);
@property (nonatomic, copy) void (^didSelectAction)();
@end
