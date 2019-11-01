//
//  NPModel.h
//  UIlabelTest
//
//  Created by STPACS on 2019/10/31.
//  Copyright © 2019 Lance. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NPModel : NSObject
@property (nonatomic, copy) NSString *question;//
@property (nonatomic, assign) BOOL show;
@property (nonatomic, assign) float questionCloseHeight;
@property (nonatomic, assign) float cellHeight;
@property (nonatomic, assign) float questionOpenHeight;
@property (nonatomic, assign) float questionHeight;

@end

NS_ASSUME_NONNULL_END
