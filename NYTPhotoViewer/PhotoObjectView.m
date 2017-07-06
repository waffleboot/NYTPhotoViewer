
#import "PhotoObjectView.h"
#import "PhotoObject+Private.h"

@implementation PhotoObjectView
- (instancetype)initWithImage:(PhotoObject *)image {
    return [super initWithImage:image.photoImage];
}
- (void)setPhotoObject:(PhotoObject *)photoObject {
    self.image = photoObject.photoImage;
}
@end
