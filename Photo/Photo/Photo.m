//
//  Photo.m
//  Photo
//
//  Created by 萨斯辈的呼唤 on 14-6-13.
//  Copyright (c) 2014年 萨斯辈的呼唤. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame width:(float)width height:(float)height image:(NSString *)imageName
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        image.frame = CGRectMake(0, 0, width, height);
        int tag = [[[imageName componentsSeparatedByString:@"."] firstObject] intValue];
        self.tag = tag + 10000;
        [self addSubview:image];
        [image release];
    }
    return self;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.target performSelector:self.action withObject:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
