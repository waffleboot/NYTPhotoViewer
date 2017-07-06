
#import "NYTScalingImageView.h"

#import "tgmath.h"

@interface NYTScalingImageView ()
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER;
@property (nonatomic) PhotoObjectView *imageView;
@end

@implementation NYTScalingImageView

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithImage:[PhotoObject new] frame:frame];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self)
        [self commonInitWithImage:nil];
    return self;
}

- (instancetype)initWithImage:(PhotoObject *)image frame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self)
        [self commonInitWithImage:image];
    return self;
}

- (void)commonInitWithImage:(PhotoObject *)image {
    [self setupInternalImageViewWithImage:image];
    [self setupImageScrollView];
    [self updateZoomScale];
}

- (void)setupInternalImageViewWithImage:(PhotoObject *)image {
    self.imageView = [[PhotoObjectView alloc] initWithPhotoObject:image];
    [self updateImage:image];
    [self addSubview:self.imageView];
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

- (void)updateImage:(PhotoObject *)image {

    // Remove any transform currently applied by the scroll view zooming.
    self.imageView.transform = CGAffineTransformIdentity;
    self.imageView.photoObject = image;
    
    self.imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    
    [self updateZoomScale];
    [self centerScrollViewContents];
}

- (void)setupImageScrollView {
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

- (void)updateZoomScale {
    if (self.imageView.photoObject) {
        CGRect scrollViewFrame = self.bounds;
        
        CGFloat scaleWidth = scrollViewFrame.size.width / self.imageView.photoObject.size.width;
        CGFloat scaleHeight = scrollViewFrame.size.height / self.imageView.photoObject.size.height;
        CGFloat minScale = MIN(scaleWidth, scaleHeight);

        self.imageView.frame = CGRectMake(0, 0,
                                          self.imageView.photoObject.size.width * minScale,
                                          self.imageView.photoObject.size.height * minScale);        
    }
}

#pragma mark - Centering

- (void)centerScrollViewContents {
    self.imageView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
}

@end
