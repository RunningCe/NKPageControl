//
//  NKPageControl.h
//  NKPageControl
//
//  Created by Nick on 2017/2/14.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NKPageControl : UIPageControl

typedef enum : NSInteger{
    /**默认：圆形**/
    NKPageControlStyleDefault,
    /**正方形**/
    NKPageControlStyleSquare,
    /**缩略图**/
    NKPageControlStyleImage
}NKPageControlStyle;

/************小圆点的个数***************/
@property (nonatomic, assign)NSInteger pageNumber;

/************小圆点的间隔******************/
@property (nonatomic, assign)CGFloat pageSpace;

/************小圆点的背景颜色**************/
@property (nonatomic, strong)UIColor *pageBackgroundColor;

/************小圆点的选中背景色*************/
@property (nonatomic, strong)UIColor *selectedColor;

/************当前点击的pageNumber**********/
@property (nonatomic, assign)NSInteger currentPageNumber;

/************当前PageControl的样式**********/
@property (nonatomic, assign)NKPageControlStyle pageControlStyle;

/************图片数组**********************/
@property (nonatomic, strong)NSMutableArray *imageArray;

/************初始化方法***************/
- (instancetype)initWithFrame:(CGRect)frame pageStyle:(NKPageControlStyle)pageControlStyle andImageArray:(NSMutableArray *)imageArray;

@end
