
#import "PhotoObjectView.h"
#import "PhotoObject+Private.h"

@implementation PhotoObjectView
- (instancetype)initWithPhotoObject:(PhotoObject *)photoObject {
    CGRect frame = photoObject ? CGRectMake(0, 0, photoObject.size.width, photoObject.size.height) : CGRectZero;
    self = [super initWithFrame:frame];
    if (self) {
        _photoObject = photoObject;
        self.backgroundColor = [UIColor redColor];
        NSLog(@"%@", photoObject.name);
    }
    return self;
}
- (void)setPhotoObject:(PhotoObject *)photoObject {
    NSLog(@"%@", photoObject.name);
    _photoObject = photoObject;
}
@end
