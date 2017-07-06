
#import "PhotoObject.h"

@implementation PhotoObject
+ (instancetype)imageNamed:(NSString *)name {
    return (PhotoObject *) [super imageNamed:name];
}
@end
