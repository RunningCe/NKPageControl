//
//  NKPageControl.m
//  NKPageControl
//
//  Created by Nick on 2017/2/14.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "NKPageControl.h"

@implementation NKPageControl

-(instancetype)initWithFrame:(CGRect)frame pageStyle:(NKPageControlStyle)pageControlStyle andImageArray:(NSMutableArray *)imageArray
{
    self = [super initWithFrame:frame];
    if (self) {
        _pageBackgroundColor = [UIColor grayColor];
        _selectedColor = [UIColor whiteColor];
        _pageSpace = 10;
        _pageControlStyle = pageControlStyle;
        _currentPageNumber = 0;
        _imageArray = [NSMutableArray arrayWithArray:imageArray];
    }
    return self;
}

#pragma mark 重写pageNumber的setter方法
- (void)setPageNumber:(NSInteger)pageNumber{
    if (_pageNumber != pageNumber) {
        _pageNumber = pageNumber;
        //创建pagecontrol小圆点
        //1.获取当前对象的宽度
        CGFloat pageControlWidth = self.frame.size.width;
        CGFloat pointWidth = (pageControlWidth - (_pageNumber - 1) *_pageSpace) / _pageNumber;
        //2.循环创建图片添加到self上
        for (int i = 0; i < _pageNumber; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((_pageSpace + pointWidth) * i, 0, pointWidth, pointWidth)];
            switch (_pageControlStyle) {
                case NKPageControlStyleImage:
                    NSLog(@"i = %d, count = %lu", i, (unsigned long)_imageArray.count);
                    if (i < _imageArray.count) {
                        imageView.image = _imageArray[i];
                    }
                    else{
                        break;
                    }
                    break;
                case NKPageControlStyleSquare:
                    break;
                case NKPageControlStyleDefault:
                    break;
                default:
                    break;
            }
            imageView.tag = 3000 + i;
            imageView.backgroundColor = _pageBackgroundColor;
            [self addSubview:imageView];
        }
        //3.设置被选中的颜色和被选中的点
        UIImageView *imageView = [self.subviews objectAtIndex:_currentPageNumber];
        imageView.backgroundColor = _selectedColor;
    }
}

- (void)setPageBackgroundColor:(UIColor *)pageBackgroundColor{
    _pageBackgroundColor = pageBackgroundColor;
    //遍历修改每张图的颜色
    if (self.subviews.count != 0) {
        for (UIImageView *imageView in self.subviews) {
            imageView.backgroundColor = _pageBackgroundColor;
        }
        UIImageView *imageView = [self.subviews objectAtIndex:_currentPageNumber];
        imageView.backgroundColor = _selectedColor;
    }
}

- (void)setSelectedColor:(UIColor *)selectedColor{
    if (_selectedColor != selectedColor) {
        _selectedColor = selectedColor;
        //有图的情况下
        if (self.subviews.count) {
            //修改被选中的那张图片的颜色
            UIImageView *imageView = [self.subviews objectAtIndex:_currentPageNumber];
            imageView.backgroundColor = _selectedColor;
        }
    }
}

- (void)setCurrentPageNumber:(NSInteger)currentPageNumber{
    if (_currentPageNumber != currentPageNumber) {
        _currentPageNumber = currentPageNumber;
        if (self.subviews.count) {
            for (UIImageView *imageView in self.subviews) {
                imageView.backgroundColor = _pageBackgroundColor;
            }
            UIImageView *imageView = [self.subviews objectAtIndex:_currentPageNumber];
            imageView.backgroundColor = _selectedColor;
            [UIView animateWithDuration:0.3 animations:^{
                imageView.transform = CGAffineTransformMakeScale(1.2, 1.2);
            } completion:^(BOOL finished) {
                imageView.transform = CGAffineTransformMakeScale(1.0, 1.0);
            }];
        }
    }
}

@end
