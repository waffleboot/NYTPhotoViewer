
#import <UIKit/UIKit.h>

@interface PhotoObject : NSObject
@property (nonatomic, assign, readonly) CGSize size;
+ (instancetype)photoNamed:(NSString *)name;
- (void)copyToPasteboard;
@end
