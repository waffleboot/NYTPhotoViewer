
#import "PhotoObjectView.h"
#import "PhotoObject+Private.h"

@implementation PhotoObjectView
- (instancetype)initWithPhotoObject:(PhotoObject *)photoObject {
    return [super initWithImage:photoObject.photoImage];
}
- (void)setPhotoObject:(PhotoObject *)photoObject {
    self.image = photoObject.photoImage;
}
@end
