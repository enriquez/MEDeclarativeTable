//
//  MEDeclarativeTable.h
//  Pods
//
//  Created by Michael Enriquez on 5/10/15.
//
//

#import <UIKit/UIKit.h>
#import "MEDeclarativeTableSection.h"
#import "MEDeclarativeTableRow.h"

@interface MEDeclarativeTable : NSObject <UITableViewDataSource, UITableViewDelegate>
- (void)addSection:(MEDeclarativeTableSection *)section;
- (void)setSections:(NSArray *)sections;
@end
