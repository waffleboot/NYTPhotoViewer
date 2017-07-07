//
//  NYTMediaViewController.h
//  NYTPhotoViewer
//
//  Created by Brian Capps on 2/11/15.
//
//

@import UIKit;
#import "NYTPhotoContainer.h"

@protocol NYTPhoto;
@protocol NYTMediaViewControllerDelegate;

NS_ASSUME_NONNULL_BEGIN

/**
 *  The view controller controlling the display of a single photo object.
 */
@interface NYTMediaViewController : UIViewController <NYTPhotoContainer>

@property (nonatomic, readonly) UIView *transitionView;

/**
 *  The internal activity view shown while the image is loading. Set from the initializer.
 */
@property (nonatomic, readonly, nullable) UIView *loadingView;

/**
 *  The gesture recognizer used to detect the double tap gesture used for zooming on photos.
 */
@property (nonatomic, readonly) UITapGestureRecognizer *doubleTapGestureRecognizer;

/**
 *  The object that acts as the photo view controller's delegate.
 */
@property (nonatomic, weak, nullable) id <NYTMediaViewControllerDelegate> delegate;

/**
 *  The designated initializer that takes the photo and activity view.
 *
 *  @param photo              The photo object that this view controller manages.
 *  @param loadingView        The view to display while the photo's image loads. This view will be hidden when the image loads.
 *  @param notificationCenter The notification center on which to observe the `NYTPhotoViewControllerPhotoImageUpdatedNotification`.
 *
 *  @return A fully initialized object.
 */
- (instancetype)initWithPhoto:(nullable id <NYTPhoto>)photo loadingView:(nullable UIView *)loadingView notificationCenter:(nullable NSNotificationCenter *)notificationCenter NS_DESIGNATED_INITIALIZER;

@property (nonatomic) CGFloat maximumZoomScale;

@end

@protocol NYTMediaViewControllerDelegate <NSObject>

@optional

/**
 *  Called when a long press is recognized.
 *
 *  @param photoViewController        The `NYTPhotoViewController` instance that sent the delegate message.
 *  @param longPressGestureRecognizer The long press gesture recognizer that recognized the long press.
 */
- (void)photoViewController:(NYTMediaViewController *)photoViewController didLongPressWithGestureRecognizer:(UILongPressGestureRecognizer *)longPressGestureRecognizer;

@end

NS_ASSUME_NONNULL_END
