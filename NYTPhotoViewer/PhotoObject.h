
#import <UIKit/UIKit.h>

@interface PhotoObject : NSObject
@property (nonatomic, strong, readonly) UIImage *photoImage;
+ (instancetype)photoNamed:(NSString *)name;
@end
