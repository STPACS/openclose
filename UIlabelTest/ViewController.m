//
//  ViewController.m
//  UIlabelTest
//
//  Created by STPACS on 2019/10/28.
//  Copyright © 2019 Lance. All rights reserved.
//

#import "ViewController.h"
#import <YYKit.h>
#import "NPTableViewCell.h"
#import <Foundation/Foundation.h>
#import "NSMutableAttributedString+CTFrameRef.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong) NSArray *dataList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    
    [self.tableView registerClass:[NPTableViewCell class] forCellReuseIdentifier:@"cellID"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    NSMutableArray *mtnArray = [NSMutableArray array];
    for (int i = 0; i < 1; i ++) {
        NPModel *model = [[NPModel alloc]init];
        model.question = @"奋斗开始讲课了三大纪律就啊的说；放假快乐的撒娇疯了；撒饭卡速度快；放假开始；啊的空间上的分界点；撒就啊舒服就啊翻发大发撒范德萨发大水发送到发的是发神经了东方斯卡拉风景；了撒娇疯了；啊就是范德萨发了；的；拉萨附近啊谁来上课；就";
        
        
        // 添加行间距
        NSMutableParagraphStyle * paragraph = [[NSMutableParagraphStyle alloc]init];
        paragraph.lineSpacing = 8;

        // 字体: 大小 颜色 行间距
        NSMutableAttributedString * mutableString = [[NSMutableAttributedString alloc]initWithString:model.question?model.question:@"" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:[UIColor orangeColor],NSParagraphStyleAttributeName:paragraph}];
        
        
        model.questionHeight = [mutableString prepareDisplayViewHeightWithWidth:[UIScreen mainScreen].bounds.size.width];
        CTFrameRef frameRef = [mutableString prepareFrameRefWithWidth:[UIScreen mainScreen].bounds.size.width];
        
        CFArrayRef lines = CTFrameGetLines(frameRef);
         
        CFIndex lineCount = CFArrayGetCount(lines);
        
        CGFloat totleHeight = [mutableString prepareDisplayViewHeightWithWidth:[UIScreen mainScreen].bounds.size.width];
        
        CGFloat threeHeight =  totleHeight / lineCount * 3 ;
        
        
        model.questionCloseHeight = threeHeight;
        model.questionOpenHeight = totleHeight;
        model.questionHeight = model.questionCloseHeight;

        [mtnArray addObject:model];
    }
    self.dataList = mtnArray;
    [self.tableView reloadData];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *identifier = @"cellID";
    NPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    cell = [[NPTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    NPModel * model = self.dataList[indexPath.row];
    cell.model = model;
    cell.selectionStyle = 0;
    cell.indexPath = indexPath;
    
    cell.refushTableCell = ^(NSIndexPath * _Nonnull indexPaths) {
      
//        NPModel * model = self.dataList[indexPaths.row];
//
    [self.tableView reloadRowAtIndexPath:indexPaths withRowAnimation:0];
        
//        [self.tableView reloadData];

    };
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NPModel * model = self.dataList[indexPath.row];
    return model.questionHeight ;
}


@end
