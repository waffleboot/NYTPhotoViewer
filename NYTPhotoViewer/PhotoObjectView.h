
#import <UIKit/UIKit.h>
#import "PhotoObject.h"

@interface PhotoObjectView : UIImageView
@property (nonatomic, strong) PhotoObject *photoObject;
- (instancetype)initWithPhotoObject:(PhotoObject *)photoObject;
@end
