//
//  PhotoViewController.m
//  Photo
//
//  Created by 萨斯辈的呼唤 on 14-6-13.
//  Copyright (c) 2014年 萨斯辈的呼唤. All rights reserved.
//

#import "PhotoViewController.h"
#import "Photo.h"
#import "ChoseViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"相机胶卷";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, 10, 280, 500)];
    [scrollView setBackgroundColor:[UIColor grayColor]];
    scrollView.contentSize = CGSizeMake(280, 2000);
    scrollView.scrollEnabled = YES;
    [self.view addSubview:scrollView];
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    int x = 0, y = 0;
    int count = 0;
    for (int i = 0 ; i < 29; i ++) {
        if (count == 2) {
            x ++;
            y = 0;
            count = 0;
        }
        Photo *image = [[Photo alloc] initWithFrame:CGRectMake(10 + 140 * y, 180 * x, 120, 160) width:120 height:160 image:[NSString stringWithFormat:@"%d.jpg", i]];
        image.target = self;
        image.action = @selector(photoClick:);
        [scrollView addSubview:image];
        [array addObject:[NSString stringWithFormat:@"%d.jpg",i]];
        [image release];
        y ++;
        count ++;
    }
    scrollView.contentSize = CGSizeMake(280, 180 * (x+1));
    _array = array;
}

- (void)photoClick:(Photo *)photo
{
    int index = photo.tag;
    NSLog(@"chose %d photo", index);
    ChoseViewController *choseVC = [[ChoseViewController alloc] init];
    [choseVC showPhoto:_array index:index];
    [self.navigationController pushViewController:choseVC animated:YES];
    
    [choseVC release];
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
