//
//  ChoseViewController.m
//  Photo
//
//  Created by 萨斯辈的呼唤 on 14-6-13.
//  Copyright (c) 2014年 萨斯辈的呼唤. All rights reserved.
//

#import "ChoseViewController.h"

@interface ChoseViewController ()

@end

@implementation ChoseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}

- (void)showPhoto:(NSArray *)array index:(int)index
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 10, 320, 540)];
    [self.scrollView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:self .scrollView];
    self.scrollView.tag = 123123;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
//    self.scrollView.bounces = YES;
    for (int i = 0; i < 29; i ++ ) {
        UIScrollView * imageScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(20 + 320 * i, 0, 280, 540)];
        imageScroll.delegate = self;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 280, 540)];
        imageView.image = [UIImage imageNamed:[array objectAtIndex:i]];
        [imageScroll addSubview:imageView];
        imageScroll.tag = 10000 + i;
        [self.scrollView addSubview:imageScroll];
        [imageScroll release];
    }
    self.scrollView.contentSize = CGSizeMake(320 * 29, 540);
    self.scrollView.delegate = self;
    
//    NSLog(@"456756%@", [self.scrollView subviews]); //???为什么是空的了
    
    NSArray *temp_array = self.scrollView.subviews;
    for (UIScrollView *temp in temp_array) {
        temp.delegate = self;
        temp.minimumZoomScale = 0.5;
        temp.maximumZoomScale = 2;
    }
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    if (scrollView.tag == 123123) {
        CGFloat offset = (NSInteger) scrollView.contentOffset.x % (NSInteger) scrollView.frame.size.width;
        if (offset < scrollView.frame.size.width / 2.0) {
            _changed = NO;
            return;
        } else {
            _changed = YES;
        }
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (_changed) {
        for (int i = 0; i < 29; i ++) {
            UIScrollView *temp = (UIScrollView *)[self.view viewWithTag:10000 + i];
            [temp setZoomScale:1.0];
        }
    }
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [scrollView.subviews firstObject];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
