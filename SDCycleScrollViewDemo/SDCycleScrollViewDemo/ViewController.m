//
//  ViewController.m
//  SDCycleScrollViewDemo
//
//  Created by 党玉华 on 2018/11/27.
//  Copyright © 2018年 dangyuhua. All rights reserved.
//

#import "ViewController.h"
#import <SDCycleScrollView.h>

@interface ViewController ()<SDCycleScrollViewDelegate>

@property(nonatomic,strong)SDCycleScrollView *cycleScrollView;

@property(nonatomic,strong)UIButton *btn1;

@property(nonatomic,strong)UIButton *btn2;

@property(nonatomic,strong)UILabel *label;

@end

@implementation ViewController

//更多的配置，请看SDCycleScrollView.h

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBtn];
    [self setupSDCycleScrollView];
}

-(void)setupSDCycleScrollView{
    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 88, self.view.bounds.size.width, 200) delegate:self placeholderImage:nil];
    self.cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    self.cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    self.cycleScrollView.autoScroll = YES;
    self.cycleScrollView.infiniteLoop = YES;
    self.cycleScrollView.hidesForSinglePage = YES;
    self.cycleScrollView.placeholderImage = [UIImage imageNamed:@"defaultImage"];
    [self.view addSubview:self.cycleScrollView];
    self.cycleScrollView.localizationImageNamesGroup = @[@"1",@"2",@"3",@"4",@"5"];
    self.cycleScrollView.titlesGroup = @[@"本地图片1",@"本地图片2",@"本地图片3",@"本地图片4",@"本地图片5"];
}

-(void)setupBtn{
    self.btn1 = [[UIButton alloc]initWithFrame:CGRectMake(50, self.view.bounds.size.height-200, self.view.bounds.size.width-100, 50)];
    [self.view addSubview:self.btn1];
    self.btn1.backgroundColor = [UIColor blueColor];
    self.btn1.tag = 1;
    [self.btn1 setTitle:@"本地图片" forState:UIControlStateNormal];
    [self.btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btn1 setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [self.btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.btn1.selected = YES;
    
    
    self.btn2 = [[UIButton alloc]initWithFrame:CGRectMake(50, self.view.bounds.size.height-120, self.view.bounds.size.width-100, 50)];
    [self.view addSubview:self.btn2];
    self.btn2.backgroundColor = [UIColor blueColor];
    self.btn2.tag = 2;
    [self.btn2 setTitle:@"网络图片" forState:UIControlStateNormal];
    [self.btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btn2 setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [self.btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 288, self.view.bounds.size.width, 20)];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    self.label.text = [NSString stringWithFormat:@"暂未点击轮播图"];
}

-(void)btnClick:(UIButton *)btn{
    if (btn.tag == 1) {
        self.btn1.selected = YES;
        self.btn2.selected = NO;
        self.cycleScrollView.localizationImageNamesGroup = @[@"1",@"2",@"3",@"4",@"5"];
        self.cycleScrollView.titlesGroup = @[@"本地图片1",@"本地图片2",@"本地图片3",@"本地图片4",@"本地图片5"];
        self.label.text = [NSString stringWithFormat:@"暂未点击轮播图"];
    }else{
        self.btn1.selected = NO;
        self.btn2.selected = YES;
        self.cycleScrollView.imageURLStringsGroup = @[@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=4243239694,1996254031&fm=26&gp=0.jpg",@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=716361461,2308025336&fm=26&gp=0.jpg",@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1307448735,4237364771&fm=26&gp=0.jpg",@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2126005396,748516889&fm=26&gp=0.jpg",@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4123933883,294533786&fm=26&gp=0.jpg"];
        self.cycleScrollView.titlesGroup = @[@"网络图片1",@"网络图片2",@"网络图片3",@"网络图片4",@"网络图片5"];
        self.label.text = [NSString stringWithFormat:@"暂未点击轮播图"];
    }
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    self.label.text = [NSString stringWithFormat:@"点击了第%zd张轮播图",index+1];
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    NSLog(@"自动滑倒了第%zd张轮播图",index+1);
}

@end
