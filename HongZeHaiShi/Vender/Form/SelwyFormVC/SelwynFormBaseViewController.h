//
//  SelwynFormBaseViewController.h
//  SelwynFormDemo
//
//  Created by BSW on 2017/6/24.
//  Copyright © 2017年 selwyn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLBaseCustomNavViewController.h"
/* submitblock */
typedef void(^FormCompletion)(void);

@interface SelwynFormBaseViewController : ZLBaseCustomNavViewController

/*baseTableView*/
@property (nonatomic, strong) UITableView *formTableView;

/* datasource */
@property (nonatomic, strong) NSMutableArray *mutableArray;

@property (nonatomic, strong) UIButton *queryButton;

/* Designated initializer */
- (instancetype)initWithStyle:(UITableViewStyle)style;

- (void)updateFormInputWithText:(NSString *)text indexPath:(NSIndexPath *)indexPath;

#pragma mark -- setCommitButton
- (void)_setCommitItem;

@end
