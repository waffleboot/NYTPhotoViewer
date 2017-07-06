
#import "NYTScalingImageView.h"

#import "tgmath.h"

@interface NYTScalingImageView ()
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER;
@property (nonatomic) PhotoObjectView *imageView;
@end

@implementation NYTScalingImageView

#pragma mark - UIView

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithImage:[PhotoObject new] frame:frame];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];

    if (self) {
        [self commonInitWithImage:nil];
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

- (instancetype)initWithImage:(PhotoObject *)image frame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        [self commonInitWithImage:image];
    }
    
    return self;
}

- (void)commonInitWithImage:(PhotoObject *)image {
    [self setupInternalImageViewWithImage:image];
    [self setupImageScrollView];
    [self updateZoomScale];
}

#pragma mark - Setup

- (void)setupInternalImageViewWithImage:(PhotoObject *)image {

    self.imageView = [[PhotoObjectView alloc] initWithPhotoObject:image];

    [self updateImage:image];
    
    [self addSubview:self.imageView];
}

- (void)updateImage:(PhotoObject *)image {

    // Remove any transform currently applied by the scroll view zooming.
    self.imageView.transform = CGAffineTransformIdentity;
    self.imageView.photoObject = image;
    
    self.imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    
    self.contentSize = image.size;
    
    [self updateZoomScale];
    [self centerScrollViewContents];
}

- (void)setupImageScrollView {
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.bouncesZoom = YES;
    self.decelerationRate = UIScrollViewDecelerationRateFast;
}

- (void)updateZoomScale {
    if (self.imageView.photoObject) {
        CGRect scrollViewFrame = self.bounds;
        
        CGFloat scaleWidth = scrollViewFrame.size.width / self.imageView.photoObject.size.width;
        CGFloat scaleHeight = scrollViewFrame.size.height / self.imageView.photoObject.size.height;
        CGFloat minScale = MIN(scaleWidth, scaleHeight);
        
        self.minimumZoomScale = minScale;
        self.maximumZoomScale = MAX(minScale, self.maximumZoomScale);
        
        self.zoomScale = self.minimumZoomScale;
        
        // scrollView.panGestureRecognizer.enabled is on by default and enabled by
        // viewWillLayoutSubviews in the container controller so disable it here
        // to prevent an interference with the container controller's pan gesture.
        //
        // This is enabled in scrollViewWillBeginZooming so panning while zoomed-in
        // is unaffected.
        self.panGestureRecognizer.enabled = NO;
    }
}

#pragma mark - Centering

- (void)centerScrollViewContents {
    CGFloat horizontalInset = 0;
    CGFloat verticalInset = 0;
    
    if (self.contentSize.width < CGRectGetWidth(self.bounds)) {
        horizontalInset = (CGRectGetWidth(self.bounds) - self.contentSize.width) * 0.5;
    }
    
    if (self.contentSize.height < CGRectGetHeight(self.bounds)) {
        verticalInset = (CGRectGetHeight(self.bounds) - self.contentSize.height) * 0.5;
    }
    
    if (self.window.screen.scale < 2.0) {
        horizontalInset = __tg_floor(horizontalInset);
        verticalInset = __tg_floor(verticalInset);
    }
    
    // Use `contentInset` to center the contents in the scroll view. Reasoning explained here: http://petersteinberger.com/blog/2013/how-to-center-uiscrollview/
    self.contentInset = UIEdgeInsetsMake(verticalInset, horizontalInset, verticalInset, horizontalInset);
}

@end
