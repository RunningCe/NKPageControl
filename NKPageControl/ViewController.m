//
//  ViewController.m
//  NKPageControl
//
//  Created by Nick on 2017/2/14.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "ViewController.h"
#import "NKPageControl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    baseView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:baseView];
    
    NSMutableArray *imageArray = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"plus"], [UIImage imageNamed:@"plus"],nil];
    NKPageControl *pageControl = [[NKPageControl alloc] initWithFrame:CGRectMake(50, 100, 50, 20) pageStyle:NKPageControlStyleImage andImageArray:imageArray];
    pageControl.selectedColor = [UIColor whiteColor];
    pageControl.pageBackgroundColor = [UIColor grayColor];
    pageControl.pageNumber = 4;
    pageControl.currentPageNumber = 0;
    
    [baseView addSubview:pageControl];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
