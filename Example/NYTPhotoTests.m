
#import "NYTPhotoTests.h"

@implementation NSArray (Photos)

+ (NSArray<NYTExamplePhoto *> *)newTestPhotos {

    NSMutableArray<NYTExamplePhoto *> *photos = [NSMutableArray array];
    
    for (NSUInteger i = 0; i < NYTViewControllerPhotoCount; i++) {

        NYTExamplePhoto *photo = [[NYTExamplePhoto alloc] init];
        
        if (i == NYTViewControllerPhotoIndexGif) {
            photo.imageData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"giphy" ofType:@"gif"]];
        } else if (i == NYTViewControllerPhotoIndexCustomEverything || i == NYTViewControllerPhotoIndexDefaultLoadingSpinner) {
            // no-op, left here for clarity:
            photo.image = nil;
        } else {
            photo.image = [UIImage imageNamed:@"NYTimesBuilding"];
        }
        
        if (i == NYTViewControllerPhotoIndexCustomEverything) {
            photo.placeholderImage = [UIImage imageNamed:@"NYTimesBuildingPlaceholder"];
        }
        
        NSString *caption = @"summary";
        switch ((NYTViewControllerPhotoIndex)i) {
            case NYTViewControllerPhotoIndexCustomEverything:
                caption = @"photo with custom everything";
                break;
            case NYTViewControllerPhotoIndexLongCaption:
                caption = @"photo with long caption. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum maximus laoreet vehicula. Maecenas elit quam, pellentesque at tempor vel, tempus non sem. Vestibulum ut aliquam elit. Vivamus rhoncus sapien turpis, at feugiat augue luctus id. Nulla mi urna, viverra sed augue malesuada, bibendum bibendum massa. Cras urna nibh, lacinia vitae feugiat eu, consectetur a tellus. Morbi venenatis nunc sit amet varius pretium. Duis eget sem nec nulla lobortis finibus. Nullam pulvinar gravida est eget tristique. Curabitur faucibus nisl eu diam ullamcorper, at pharetra eros dictum. Suspendisse nibh urna, ultrices a augue a, euismod mattis felis. Ut varius tortor ac efficitur pellentesque. Mauris sit amet rhoncus dolor. Proin vel porttitor mi. Pellentesque lobortis interdum turpis, vitae tincidunt purus vestibulum vel. Phasellus tincidunt vel mi sit amet congue.";
                break;
            case NYTViewControllerPhotoIndexDefaultLoadingSpinner:
                caption = @"photo with loading spinner";
                break;
            case NYTViewControllerPhotoIndexNoReferenceView:
                caption = @"photo without reference view";
                break;
            case NYTViewControllerPhotoIndexCustomMaxZoomScale:
                caption = @"photo with custom maximum zoom scale";
                break;
            case NYTViewControllerPhotoIndexGif:
                caption = @"animated GIF";
                break;
            case NYTViewControllerPhotoCount:
                // this case statement intentionally left blank.
                break;
        }
        
        photo.attributedCaptionTitle = [[NSAttributedString alloc] initWithString:@(i + 1).stringValue attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleBody]}];
        photo.attributedCaptionSummary = [[NSAttributedString alloc] initWithString:caption attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor], NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleBody]}];
        photo.attributedCaptionCredit = [[NSAttributedString alloc] initWithString:@"NYT Building Photo Credit: Nic Lehoux" attributes:@{NSForegroundColorAttributeName: [UIColor grayColor], NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1]}];
        
        [photos addObject:photo];
    }
    
    return photos;
}

- (BOOL)isNoReferenceView:(id<NYTPhoto>)photo {
    return [photo isEqual:self[NYTViewControllerPhotoIndexNoReferenceView]];
}

- (BOOL)isCustomEverything:(id<NYTPhoto>)photo {
    return [photo isEqual:self[NYTViewControllerPhotoIndexCustomEverything]];
}

- (BOOL)isCustomMaxZoomScale:(id<NYTPhoto>)photo {
    return [photo isEqual:self[NYTViewControllerPhotoIndexCustomMaxZoomScale]];
}

@end
