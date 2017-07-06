
#import <UIKit/UIKit.h>
#import "PhotoObject.h"

@interface PhotoObjectView : UIView
@property (nonatomic, strong) PhotoObject *photoObject;
- (instancetype)initWithPhotoObject:(PhotoObject *)photoObject;
@end
