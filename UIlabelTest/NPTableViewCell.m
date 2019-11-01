//
//  NPTableViewCell.m
//  UIlabelTest
//
//  Created by STPACS on 2019/10/31.
//  Copyright © 2019 Lance. All rights reserved.
//

#import "NPTableViewCell.h"
#import "TLDisplayView.h"
#import <Masonry.h>


@interface NPTableViewCell()<TLDisplayViewDelegate>
@property (nonatomic, strong) TLDisplayView *displayView;

@end

@implementation NPTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self prepareUI];
    }
    return self;
}


- (void)prepareUI {
    
    self.displayView.backgroundColor = [UIColor yellowColor];

    
   
}

- (void)setModel:(NPModel *)model {
    
    _model = model;
    
    self.displayView.open = self.model.show;

    // 添加行间距
    NSMutableParagraphStyle * paragraph = [[NSMutableParagraphStyle alloc]init];
    paragraph.lineSpacing = 8;

    // 字体: 大小 颜色 行间距
    NSAttributedString * attributedStr = [[NSAttributedString alloc]initWithString:model.question?model.question:@"" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:[UIColor grayColor],NSParagraphStyleAttributeName:paragraph}];
    
    [self.displayView setAttributedText:attributedStr];
   
}


- (TLDisplayView *)displayView {
    if (_displayView == nil) {
        _displayView = [[TLDisplayView alloc] init];
        _displayView.numberOfLines = 3;
        _displayView.delegate = self;
        _displayView.lineSpace = 8;
        _displayView.font = [UIFont systemFontOfSize:16];
        _displayView.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width;
        [_displayView setOpenString:@"展开" closeString:@"收起" font:[UIFont systemFontOfSize:16] textColor:[UIColor orangeColor]];

//        _displayView.backgroundColor = UIColor.orangeColor;
        [self addSubview:_displayView];
        
        [_displayView mas_makeConstraints:^(MASConstraintMaker *make) {
               
               make.left.mas_equalTo(self.mas_left).mas_offset(0);
               make.top.mas_equalTo(self.mas_top).mas_offset(0);
//               make.bottom.mas_equalTo(self.mas_bottom);
               make.right.mas_equalTo(self.mas_right).mas_offset(0);
               
           }];
    }
    return _displayView;
}

#pragma mark TLDisplayViewDelegate
- (void)displayView:(TLDisplayView *)label closeHeight:(CGFloat)height {
 
    self.model.show = NO;

    self.model.questionHeight = self.model.questionCloseHeight;
          
      //刷新当前cell
      if (self.refushTableCell) {
          self.refushTableCell(self.indexPath);
      }
}

- (void)displayView:(TLDisplayView *)label openHeight:(CGFloat)height {

    self.model.show = YES;

    self.model.questionHeight = self.model.questionOpenHeight;
          
          //刷新当前cell
          if (self.refushTableCell) {
              self.refushTableCell(self.indexPath);
          }
    
}


@end
