
#import "NYTPhotosDataSource.h"

@interface NYTPhotosDataSource ()
@property (nonatomic, copy) NSArray *photos;
@end

@implementation NYTPhotosDataSource

- (instancetype)init {
    return [self initWithPhotos:nil];
}

- (instancetype)initWithPhotos:(NSArray *)photos {
    self = [super init];
    if (self)
        _photos = photos;
    return self;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(__unsafe_unretained id [])buffer count:(NSUInteger)length {
    return [self.photos countByEnumeratingWithState:state objects:buffer count:length];
}

- (NSUInteger)numberOfPhotos {
    return self.photos.count;
}

- (id <NYTPhoto>)photoAtIndex:(NSUInteger)photoIndex {
    if (photoIndex < self.photos.count)
        return self.photos[photoIndex];
    return nil;
}

- (NSUInteger)indexOfPhoto:(id <NYTPhoto>)photo {
    return [self.photos indexOfObject:photo];
}

- (BOOL)containsPhoto:(id <NYTPhoto>)photo {
    return [self.photos containsObject:photo];
}

- (id <NYTPhoto>)objectAtIndexedSubscript:(NSUInteger)photoIndex {
    return [self photoAtIndex:photoIndex];
}

@end
