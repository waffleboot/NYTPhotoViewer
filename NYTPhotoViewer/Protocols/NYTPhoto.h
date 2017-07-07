//
//  NYTPhoto.h
//  NYTPhotoViewer
//
//  Created by Brian Capps on 2/10/15.
//  Copyright (c) 2015 NYTimes. All rights reserved.
//

@import UIKit;

#import "NYTPhotoContent.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  The model for photos displayed in an `NYTPhotosViewController`.
 *
 *  Your models (or boxes, if working with Swift value types) should override `isEqual:` to provide a concept of identity for the PhotoViewer to work with. 
 */
@protocol NYTPhoto <NSObject>

@property (nonatomic, readonly, nullable) id<NYTPhotoContent> content;

/**
 *  A placeholder image for display while the image is loading.
 *
 *  This property is used if and only if `-imageData` and `-image` return `nil`.
 */
@property (nonatomic, readonly, nullable) UIImage *placeholderImage;

#pragma mark Caption

/**
 *  An attributed string for display as the title of the caption.
 */
@property (nonatomic, readonly, nullable) NSAttributedString *attributedCaptionTitle;

/**
 *  An attributed string for display as the summary of the caption.
 */
@property (nonatomic, readonly, nullable) NSAttributedString *attributedCaptionSummary;

/**
 *  An attributed string for display as the credit of the caption.
 */
@property (nonatomic, readonly, nullable) NSAttributedString *attributedCaptionCredit;

@end

NS_ASSUME_NONNULL_END
