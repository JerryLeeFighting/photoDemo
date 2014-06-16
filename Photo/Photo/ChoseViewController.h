//
//  ChoseViewController.h
//  Photo
//
//  Created by 萨斯辈的呼唤 on 14-6-13.
//  Copyright (c) 2014年 萨斯辈的呼唤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoseViewController : UIViewController <UIScrollViewDelegate>
{
    BOOL _changed;
}
@property (nonatomic, retain) UIScrollView *scrollView;

- (void)showPhoto:(NSArray *)array index:(int)index;

@end
