//
//  NYTPhotoContent.h
//  NYTPhotoViewer
//
//  Created by Андрей on 07.07.17.
//  Copyright © 2017 NYTimes. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NYTPhotoContent <NSObject>

@property (nonatomic, readonly, nullable) NSURL *source;

/**
 *  The image to display.
 *
 *  This property is used if and only if `-imageData` returns `nil`. Note, however, that returning `UIImage`s from this property whenever possible will result in better performance. See `-imageData`'s documentation for discussion.
 */
@property (nonatomic, readonly, nullable) UIImage *image;

/**
 *  The image data to display.
 *
 *  This property's value, if non-`nil`, is preferred over `-image`. This allows clients to provide image data for FLAnimatedImage when the library is compiled with `ANIMATED_GIF_SUPPORT` defined.
 *
 *  Note that if you're working with a non-animated image, using a native `UIImage` will provide better performance. Therefore, it is recommended to return `nil` from this property unless this photo is an animated GIF.
 */
@property (nonatomic, readonly, nullable) NSData *imageData;

@end
