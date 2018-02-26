//
//  ZLQuickLookVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/7.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLQuickLookVC.h"

@interface ZLQuickLookVC ()

@end

@implementation ZLQuickLookVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"附件预览";
    _previewController = [[QLPreviewController alloc] init];
    _previewController.dataSource = self;
    _previewController.delegate = self;
    
    _previewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width , self.view.frame.size.height);
    _previewController.currentPreviewItemIndex = 0;
    [self addChildViewController:_previewController];
    [self.view addSubview:_previewController.view];
    [_previewController reloadData];
}
- (id <QLPreviewItem>) previewController: (QLPreviewController *) controller previewItemAtIndex: (NSInteger) index{
    return self.fileURL;
}
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller{
    return 1;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSMutableAttributedString *)setTitle{
    
    NSDictionary *dic = @{NSFontAttributeName:CHINESE_SYSTEM(18),
                          NSForegroundColorAttributeName:[UIColor whiteColor]
                          };
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"附件预览" attributes:dic];
    
    return title;
    
}


@end
