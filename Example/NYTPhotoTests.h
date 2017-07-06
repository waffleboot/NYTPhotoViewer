
#import <Foundation/Foundation.h>
#import "NYTExamplePhoto.h"

typedef NS_ENUM(NSUInteger, NYTViewControllerPhotoIndex) {
    NYTViewControllerPhotoIndexCustomEverything = 1,
    NYTViewControllerPhotoIndexLongCaption = 2,
    NYTViewControllerPhotoIndexDefaultLoadingSpinner = 3,
    NYTViewControllerPhotoIndexNoReferenceView = 4,
    NYTViewControllerPhotoIndexCustomMaxZoomScale = 5,
    NYTViewControllerPhotoIndexGif = 6,
    NYTViewControllerPhotoCount,
};

@interface NSArray (Photos)

+ (NSArray<NYTExamplePhoto *> *)newTestPhotos;

- (BOOL)isNoReferenceView:(id<NYTPhoto>)photo;
- (BOOL)isCustomEverything:(id<NYTPhoto>)photo;
- (BOOL)isCustomMaxZoomScale:(id<NYTPhoto>)photo;

@end
