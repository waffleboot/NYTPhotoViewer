
@import Foundation;

#import "NYTPhotosViewControllerDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface NYTPhotosDataSource : NSObject <NYTPhotosViewControllerDataSource>
- (instancetype)initWithPhotos:(nullable NSArray *)photos NS_DESIGNATED_INITIALIZER;
@end

NS_ASSUME_NONNULL_END
