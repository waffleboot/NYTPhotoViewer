
#import "PhotoObject.h"
#import "PhotoObject+Private.h"

@interface PhotoObject ()
@property (nonatomic, strong, readwrite) NSString *name;
@end

@implementation PhotoObject

+ (instancetype)photoNamed:(NSString *)name {
    return [[PhotoObject alloc] initWithName:name];
}

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}

- (CGSize)size {
    return CGSizeMake(1280, 720);
}

- (void)copyToPasteboard {
    [[UIPasteboard generalPasteboard] setString:self.name];
}

@end
