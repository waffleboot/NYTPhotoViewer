//
//  NYTMediaView.h
//  NYTPhotoViewer
//
//  Created by Harrison, Andrew on 7/23/13.
//  Copyright (c) 2015 The New York Times Company. All rights reserved.
//

@import UIKit;

#import "NYTPhotoContent.h"

#ifdef ANIMATED_GIF_SUPPORT
@class FLAnimatedImageView;
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NYTMediaView : UIScrollView

/**
 *  The image view used internally as the contents of the scroll view.
 */
#ifdef ANIMATED_GIF_SUPPORT
@property (nonatomic, readonly) FLAnimatedImageView *imageView;
#else
@property (nonatomic, readonly) UIImageView *imageView;
#endif

- (instancetype)initWithContent:(nullable id<NYTPhotoContent>)content withPlaceholder:(nullable UIImage *)placeholder frame:(CGRect)frame NS_DESIGNATED_INITIALIZER;

- (void)updateContent:(id<NYTPhotoContent>)content;

/**
 *  Centers the image inside of the scroll view. Typically used after rotation, or when zooming has finished.
 */
- (void)centerScrollViewContents;

@end

NS_ASSUME_NONNULL_END
