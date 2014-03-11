//
//  JEProgressView.m
//  
//
//  Created by John Rommel Estropia on 2014/03/11.
//  Copyright (c) 2014 John Rommel Estropia. All rights reserved.
//

#import "JEProgressView.h"


@interface JEProgressView ()

@property (nonatomic, weak) UIImageView *trackImageView;
@property (nonatomic, weak) UIImageView *progressImageView;

@end


@implementation JEProgressView

#pragma mark - NSObject

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupProgressView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self setupProgressView];
    }
    return self;
}


#pragma mark - UIView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    UIImageView *trackImageView = self.trackImageView;
    UIImageView *progressImageView = self.progressImageView;
    if (!trackImageView || !progressImageView)
    {
        return;
    }
    
    CGRect bounds = self.bounds;
    CGFloat boundsTop = CGRectGetMinY(bounds);
    UIImage *trackImage = self.trackImage;
    if (trackImage)
    {
        CGRect trackFrame = trackImageView.frame;
        CGFloat trackHeight = trackImage.size.height;
        trackImageView.frame = (CGRect){
            .origin.x = CGRectGetMinX(trackFrame),
            .origin.y = (boundsTop
                         + ((CGRectGetHeight(bounds) - trackHeight) * 0.5f)),
            .size.width = CGRectGetWidth(trackFrame),
            .size.height = trackHeight
        };
    }
    
    UIImage *progressImage = self.progressImage;
    if (progressImage)
    {
        CGRect progressFrame = progressImageView.frame;
        CGFloat progressHeight = progressImage.size.height;
        progressImageView.frame = (CGRect){
            .origin.x = CGRectGetMinX(progressFrame),
            .origin.y = (boundsTop
                         + ((CGRectGetHeight(bounds) - progressHeight) * 0.5f)),
            .size.width = CGRectGetWidth(progressFrame),
            .size.height = progressHeight
        };
    }
}


#pragma mark - UIProgressView

- (void)setProgressImage:(UIImage *)progressImage
{
    [super setProgressImage:progressImage];
    self.progressImageView.image = progressImage;
}

- (void)setTrackImage:(UIImage *)trackImage
{
    [super setTrackImage:trackImage];
    self.trackImageView.image = trackImage;
}


#pragma mark - private

- (void)setupProgressView
{
    if ([[UIDevice currentDevice].systemVersion compareWithVersion:@"7.1"] == NSOrderedAscending)
    {
        return;
    }
    
    NSArray *subviews = self.subviews;
    if ([subviews count] != 2)
    {
        return;
    }
    
    for (UIView *subview in subviews)
    {
        if (![subview isKindOfClass:[UIImageView class]])
        {
            return;
        }
    }
    
    self.trackImageView = subviews[0];
    self.progressImageView = subviews[1];
}


@end
