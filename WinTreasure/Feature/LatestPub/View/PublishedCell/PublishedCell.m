//
//  PublishedCell.m
//  WinTreasure
//
//  Created by Apple on 16/6/15.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "PublishedCell.h"
#import "LatestPublishModel.h"
#define kPublishedCellImageViewMargin 8
#define kPublishedCellImageViewPadding 20
#define kPublishedCellLabelMargin 4
#define kPublishedCellLabelHeight 16

@implementation PublishedCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];

}

+ (CGSize)getItemSize {
    CGFloat imgHeight = (kScreenWidth-0.5)/2.0-kPublishedCellImageViewPadding*2;
    CGFloat productNameHeight = 38.0;
    CGSize size = CGSizeMake((kScreenWidth-0.5)/2.0, kPublishedCellImageViewMargin+imgHeight+kPublishedCellImageViewMargin+productNameHeight+kPublishedCellLabelMargin*5+kPublishedCellLabelHeight*5);
    return size;
}

- (void)setModel:(LatestPublishModel *)model {
    _model = model;
    [_productImagView setImageURL:[NSURL URLWithString:_model.imgUrl]];
    _productNameLabel.text = _model.productName;
    _periodNumberLabel.text = _model.periodNumber;
    
    NSMutableAttributedString *attrName = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"获奖者：%@",_model.winner]];
    [attrName setColor:UIColorHex(0x007AFF) range:NSMakeRange(4, _model.winner.length)];
    _winnerLabel.attributedText = attrName;
    
    NSMutableAttributedString *attrNumber = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"幸运号码：%@",_model.luckyNumber]];
    [attrNumber setColor:kDefaultColor range:NSMakeRange(5, _model.luckyNumber.length)];
    _luckyNumberLabel.attributedText = attrNumber;
    
    _participateLabel.text = [NSString stringWithFormat:@"参与次数：%@",_model.partInTimes];

    _publishTimeLabel.text = [NSString stringWithFormat:@"揭晓时间：%@",_model.publishTime];

}

@end
