
#import "PhotoObject.h"

@interface PhotoObject ()
@property (nonatomic, strong, readwrite) UIImage *photoImage;
@end

@implementation PhotoObject

+ (instancetype)photoNamed:(NSString *)name {
    return [[PhotoObject alloc] initWithName:name];
}

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _photoImage = [UIImage imageNamed:name];
    }
    return self;
}

@end
