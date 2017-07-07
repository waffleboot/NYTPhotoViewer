//
//  NYTScalingImageView.m
//  NYTPhotoViewer
//
//  Created by Harrison, Andrew on 7/23/13.
//  Copyright (c) 2015 The New York Times Company. All rights reserved.
//

#import "NYTMediaView.h"
@import OGVKit;

#import "tgmath.h"

@interface NYTMediaView ()

- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER;

@property (nonatomic) OGVPlayerView *playerView;

@end

@implementation NYTMediaView

#pragma mark - UIView

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithContent:nil withPlaceholder:nil frame:frame];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self commonInitWithSource:nil];
    }
    
    return self;
}

- (void)didAddSubview:(UIView *)subview {
    [super didAddSubview:subview];
    [self centerScrollViewContents];
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self updateZoomScale];
    [self centerScrollViewContents];
}

#pragma mark - NYTScalingImageView

- (instancetype)initWithContent:(id<NYTPhotoContent>)content withPlaceholder:(UIImage *)placeholder frame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInitWithSource:content.source];
    }
    return self;
}

- (void)commonInitWithSource:(NSURL *)source {
    [self setupInternalImageViewWithSource:source];
    [self setupImageScrollView];
    [self updateZoomScale];
}

#pragma mark - Setup

- (void)setupInternalImageViewWithSource:(NSURL *)source {

    self.playerView = [[OGVPlayerView alloc] init];

    [self updateSource:source];
    
    [self addSubview:self.playerView];
}

- (void)updateContent:(id<NYTPhotoContent>)content {
    [self updateSource:content.source ];
}

- (void)updateSource:(NSURL *)source {
    
    // Remove any transform currently applied by the scroll view zooming.
    
    self.playerView.sourceURL = source;
    if (source) {
        [self.playerView play];
    }
    
    self.playerView.frame = CGRectMake(0, 0, 1280, 720);
    
    [self updateZoomScale];
    [self centerScrollViewContents];
}

- (void)setupImageScrollView {
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

- (void)updateZoomScale {
    if (self.playerView.sourceURL) {
        CGRect scrollViewFrame = self.bounds;
            
        CGFloat scaleWidth = scrollViewFrame.size.width / 284.;
        CGFloat scaleHeight = scrollViewFrame.size.height / 160.;
        CGFloat minScale = MIN(scaleWidth, scaleHeight);
            
        self.playerView.frame = CGRectMake(0, 0, 284. * minScale, 160. * minScale);
            
    }
}
    
#pragma mark - Centering
    
- (void)centerScrollViewContents {
    self.playerView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
}
    
@end
