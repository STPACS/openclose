//
//  NPTableViewCell.h
//  UIlabelTest
//
//  Created by STPACS on 2019/10/31.
//  Copyright © 2019 Lance. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NPModel.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NPTableViewCell : UITableViewCell

@property (nonatomic, strong) NPModel *model;

@property (nonatomic , copy) void (^refushTableCell) (NSIndexPath *indexPaths);//刷新首页的表格

@property (nonatomic, strong) NSIndexPath *indexPath;

@end

NS_ASSUME_NONNULL_END
