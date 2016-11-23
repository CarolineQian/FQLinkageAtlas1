//
//  FQPhotoAlbumController.m
//  FQPhotoAlbum
//
//  Created by 冯倩 on 2016/11/14.
//  Copyright © 2016年 冯倩. All rights reserved.
//

#import "FQPhotoAlbumController.h"

@interface FQPhotoAlbumController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>
{
    NSArray      *_imageArray;         //图片数组
    UIScrollView *_mainScrollView;     //中间主scrollView
    UIScrollView *_bottomScrollView;   //底部scrollView
    UIView       *_underLineView;      //底部线条
    CGFloat      offset;
}

@end

@implementation FQPhotoAlbumController

- (void)viewDidLoad
{
    [super viewDidLoad];
    offset = 0.0;
    self.title = @"图片";
    _imageArray = @[@"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150327/21033WY8-3.jpg",
                    @"http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg",
                    @"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150409/022A9A50-3.jpg",
                    @"http://tx.haiqq.com/uploads/allimg/150325/122259EJ-13.jpg"
                    ];
    
    //问题1:原因:若scrollView是添加在navagation中vc上的第一个视图的话,内部子控件会整体下移64像素
    //问题2:UIImageView加载图片不显示,因为没在Plist文件中设置https请求
    
    
    //主ScrollView
    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, (self.view.height - 64 - 70))];
    _mainScrollView.delegate = self;
    _mainScrollView.bounces = NO;    //关闭回弹
    _mainScrollView.backgroundColor = [UIColor redColor];
    _mainScrollView.showsHorizontalScrollIndicator=NO;
    _mainScrollView.showsVerticalScrollIndicator=NO;
    _mainScrollView.userInteractionEnabled = YES;
    _mainScrollView.contentSize = CGSizeMake(self.view.width * _imageArray.count, 0);
    //设置此属性,则必须整页的偏移
    _mainScrollView.pagingEnabled = YES;
    [self.view addSubview:_mainScrollView];
    
    //底部ScrollView
    _bottomScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.view.height - 70, self.view.width, 70)];
    _bottomScrollView.backgroundColor = [UIColor whiteColor];
    _bottomScrollView.delegate = self;
    _bottomScrollView.bounces = NO;
    _bottomScrollView.showsHorizontalScrollIndicator=NO;
    _bottomScrollView.showsVerticalScrollIndicator=NO;
    _bottomScrollView.contentSize = CGSizeMake(70 * _imageArray.count, 0);
    [self.view addSubview:_bottomScrollView];
    
    
    
    //循环添加
    for (int i = 0; i < _imageArray.count; i ++)
    {
        UIScrollView *s = [[UIScrollView alloc] initWithFrame:CGRectMake(self.view.width*i, _mainScrollView.height / 2 - 100 - 64, self.view.width, 200)];
        s.backgroundColor = [UIColor whiteColor];
        s.contentSize = CGSizeMake(self.view.width, 460);
        s.showsHorizontalScrollIndicator = NO;
        s.showsVerticalScrollIndicator = NO;
        s.delegate = self;
        s.minimumZoomScale = 1.0;
        s.maximumZoomScale = 2.0;
        s.zoomScale = 1.0;
        [_mainScrollView addSubview:s];
        //主
        UIImageView *mainImgView = [[UIImageView alloc] init];
        mainImgView.frame = CGRectMake(_mainScrollView.width * i, 0, _mainScrollView.width, 200);
        mainImgView.contentMode = UIViewContentModeScaleAspectFit;
        [mainImgView sd_setImageWithURL:[NSURL URLWithString:_imageArray[i]]];
        //问题3:真机运行时,imageView和Button上图片不显示,因为比例差太多,加上下面这句,调节下尺寸即可
        [s addSubview:mainImgView];
        
        
        //底部
        UIButton *bottomBtn = [[UIButton alloc] init];
        bottomBtn.frame = CGRectMake(70 * i, 0, 70, 70);
        bottomBtn.tag = i;
        [bottomBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:_imageArray[i]] forState:UIControlStateNormal];
        bottomBtn.contentMode = UIViewContentModeScaleAspectFit;
        [bottomBtn addTarget:self action:@selector(bottomBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomScrollView addSubview:bottomBtn];
        
        
    }
    
    //底部线条
    _underLineView = [[UIView alloc] initWithFrame:CGRectMake(0, _bottomScrollView.height - 2, 70, 2)];
    _underLineView.backgroundColor = [UIColor redColor];
    [_bottomScrollView addSubview:_underLineView];
    
    if (_imageArray.count == 1)
    {
        _mainScrollView.scrollEnabled = NO;
        _bottomScrollView.scrollEnabled = NO;
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Method

- (CGFloat)countOffSet:(CGFloat )x
{
    //计算底部scrollView的偏移量
    CGFloat realOffSetX = x - _bottomScrollView.width / 2;
    if (realOffSetX < 0)
    {
        realOffSetX = 0;
    }
    CGFloat maxOffSetX = _bottomScrollView.contentSize.width - _bottomScrollView.width;
    if (realOffSetX > maxOffSetX)
    {
        realOffSetX = maxOffSetX;
    }
    if (maxOffSetX < 0)
        realOffSetX = 0;
    
    return realOffSetX;
}

#pragma mark - Actions
//点击底部按钮显示
- (void)bottomBtnAction:(UIButton *)sender
{
    if (_imageArray.count == 1)
    {
        return;
    }
    else
    {
        //动画
        [UIView animateWithDuration:0.5 animations:^
         {
             [_mainScrollView setContentOffset:CGPointMake(_mainScrollView.width * sender.tag, -64) animated:NO];
             
             [_bottomScrollView setContentOffset:CGPointMake([self countOffSet:sender.center.x], 0) animated:NO];
             _underLineView.frame = CGRectMake(sender.tag * 70, _bottomScrollView.height - 2, 70, 2);
         }];
        //显示图片
        for (UIScrollView *s in _mainScrollView.subviews)
        {
            if ([s isKindOfClass:[UIScrollView class]])
            {
                s.zoomScale = 1.0;
                UIImageView *image = [[s subviews] objectAtIndex:0];
                image.frame = CGRectMake(0, 0, _mainScrollView.width, 200);
            }
        }
        
    }
    
}

#pragma mark - UIScrollViewDelegate

//一次滑动停止时执行
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == _mainScrollView)
    {
        if (_imageArray.count == 1)
        {
            return;
        }
        else
        {
            int page = scrollView.contentOffset.x / scrollView.width;  //偏移了几张图
            //动画
            [UIView animateWithDuration:0.5 animations:^
             {
                 //底部scrollView和红线跟着偏移
                 [_bottomScrollView setContentOffset:CGPointMake([self countOffSet: (page + 1) * 70 - 35 ], 0) animated:NO];
                 _underLineView.frame = CGRectMake(page * 70, _bottomScrollView.height - 2, 70, 2);
                 
             }];
            //显示图片
            CGFloat x = scrollView.contentOffset.x;
            if (x==offset)//缩放走这个方法
            {
                return;
            }
            else//拖动走这个方法
            {
                offset = x;
                for (UIScrollView *s in scrollView.subviews)
                {
                    if ([s isKindOfClass:[UIScrollView class]])
                    {
                        s.zoomScale = 1.0;
                        UIImageView *image = [[s subviews] objectAtIndex:0];
                        image.frame = CGRectMake(0, 0, _mainScrollView.width, 200);
                    }
                }
            }
            
        }
        
    }
    
}
//每次拖动,要走很多遍这个
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    for (UIView *v in scrollView.subviews)
    {
        return v;
    }
    return nil;
}




@end
