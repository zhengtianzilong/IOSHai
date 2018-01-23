//
//  ZLFormInputAndImageTableViewCell.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/22.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLFormInputAndImageTableViewCell.h"
#import "SelwynExpandableTextView.h"
#import "SelwynFormItem.h"
#import "SelwynFormHandle.h"

@interface ZLFormInputAndImageTableViewCell()<UITextViewDelegate>

@property (nonatomic, assign) CGFloat lastCellHeight;
@property (nonatomic, copy) NSString *inputDetail;

@end

@implementation ZLFormInputAndImageTableViewCell

- (void)setFormItem:(SelwynFormItem *)formItem
{
    _formItem = formItem;
    
    self.inputDetail = formItem.formDetail;
    self.titleLabel.attributedText = formItem.formAttributedTitle;
    self.textView.editable = formItem.editable;
    self.textView.keyboardType = formItem.keyboardType;
    self.textView.attributedPlaceholder = formItem.attributedPlaceholder;
    
    self.accessoryType = UITableViewCellAccessoryNone;
}

#pragma mark -- layout subviews
- (void)layoutSubviews
{
    [super layoutSubviews];

//    self.imageV.frame = CGRectMake(Main_Screen_Width - TitleHeight, EdgeMarin, TitleHeight, TitleHeight);
//
//    self.imageV.image = [UIImage imageNamed:_formItem.imageName];
    
//    self.titleLabel.frame = CGRectMake(EdgeMarin, EdgeMarin, TitleWidth, TitleHeight);
//
//    CGFloat newHeight = [ZLFormInputAndImageTableViewCell cellHeightWithItem:_formItem];
//
//    self.textView.frame = CGRectMake(TitleWidth + 2*EdgeMarin, EdgeMarin, Main_Screen_Width - (TitleWidth + 3*EdgeMarin), MAX(TitleHeight, newHeight - EdgeMarin));
    
    self.titleLabel.frame = CGRectMake(EdgeMarin, EdgeMarin, TitleWidth, TitleHeight);
    
    CGFloat newHeight = [ZLFormInputAndImageTableViewCell cellHeightWithItem:_formItem];
    
    self.textView.frame = CGRectMake(TitleWidth + 2*EdgeMarin, EdgeMarin, Main_Screen_Width - (TitleWidth + 3*EdgeMarin), MAX(TitleHeight, newHeight - EdgeMarin));
    
}

#pragma mark -- cell height
+ (CGFloat)cellHeightWithItem:(SelwynFormItem *)item
{
    CGSize detailSize = [SelwynFormHandle getSizeWithString:item.formDetail Font:Font(TitleFont) maxSize:CGSizeMake(Main_Screen_Width - (TitleWidth + 3*EdgeMarin), MAXFLOAT)];
    
    return MAX(TitleHeight+2*EdgeMarin ,detailSize.height + 2*EdgeMarin);
}

#pragma mark -- word limit
- (void)limitTextViewTextLength{
    
    NSString *toBeString = self.textView.text;
    NSArray *currentar = [UITextInputMode activeInputModes];
    UITextInputMode *current = [currentar firstObject];
    
    if ([current.primaryLanguage isEqualToString:@"zh-Hans"]) {
        
        UITextRange *selectedRange = [self.textView markedTextRange];
        
        UITextPosition *position = [self.textView positionFromPosition:selectedRange.start offset:0];
        
        if (!position) {
            if (toBeString.length > _formItem.maxInputLength) {
                self.textView.text = [toBeString substringToIndex:_formItem.maxInputLength];
            }
        }
    }
    else{
        if (toBeString.length > _formItem.maxInputLength) {
            self.textView.text = [toBeString substringToIndex:_formItem.maxInputLength];
        }
    }
}

- (void)textViewDidChange:(UITextView *)theTextView
{
    if (_formItem.maxInputLength > 0) {
        [self limitTextViewTextLength];
    }
    
    _inputDetail = self.textView.text;
    
    if (_formInputAndImageCompletion) {
        _formInputAndImageCompletion(_inputDetail);
    }
    
    [UIView performWithoutAnimation:^{
        [self.expandableTableView beginUpdates];
        [self.expandableTableView endUpdates];
    }];
}

- (void)setInputDetail:(NSString *)inputDetail
{
    _inputDetail = inputDetail;
    
    self.textView.text = inputDetail;
}

@end

@implementation UITableView (ZLFormInputAndImageTableViewCell)

- (ZLFormInputAndImageTableViewCell *)formInputAndImageCellWithId:(NSString *)cellId
{
    ZLFormInputAndImageTableViewCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        cell = [[ZLFormInputAndImageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.expandableTableView = self;
    }
    
    return cell;
}


@end
