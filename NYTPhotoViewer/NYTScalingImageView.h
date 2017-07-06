
@import UIKit;
#import "PhotoObject.h"
#import "PhotoObjectView.h"

NS_ASSUME_NONNULL_BEGIN

@interface NYTScalingImageView : UIView

/**
 *  The image view used internally as the contents of the scroll view.
 */
@property (nonatomic, readonly) PhotoObjectView *imageView;

/**
 *  Initializes a scaling image view with a `UIImage`. This object is a `UIScrollView` that contains a `UIImageView`. This allows for zooming and panning around the image.
 *
 *  @param image A `UIImage` for zooming and panning.
 *  @param frame The frame of the view.
 *
 *  @return A fully initialized object.
 */
- (instancetype)initWithImage:(PhotoObject *)image frame:(CGRect)frame NS_DESIGNATED_INITIALIZER;

/**
 *  Updates the image in the image view and centers and zooms the new image.
 *
 *  @param image The new image to display in the image view.
 */
- (void)updateImage:(PhotoObject *)image;

/**
 *  Centers the image inside of the scroll view. Typically used after rotation, or when zooming has finished.
 */
- (void)centerScrollViewContents;

@end

NS_ASSUME_NONNULL_END
