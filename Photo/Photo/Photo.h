//
//  Photo.h
//  Photo
//
//  Created by 萨斯辈的呼唤 on 14-6-13.
//  Copyright (c) 2014年 萨斯辈的呼唤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Photo : UIView


- (instancetype)initWithFrame:(CGRect)frame width:(float)width height:(float)height image:(NSString *)imageName;

@property (nonatomic, assign) id target;
@property (nonatomic, assign) SEL action;

@end
