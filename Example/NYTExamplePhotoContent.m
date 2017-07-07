//
//  NYTExamplePhotoContent.m
//  NYTPhotoViewer
//
//  Created by Андрей on 07.07.17.
//  Copyright © 2017 NYTimes. All rights reserved.
//

#import "NYTExamplePhotoContent.h"

@implementation NYTExamplePhotoContent

- (instancetype)initWithImage:(UIImage *)image {
    self = [super init];
    if (self) {
        _image = image;
    }
    return self;
}

- (instancetype)initWithImageData:(NSData *)imageData {
    self = [super init];
    if (self) {
        _imageData = imageData;
    }
    return self;
}

+ (instancetype)contentNamed:(NSString *)name {
    return [[NYTExamplePhotoContent alloc] initWithImage:[UIImage imageNamed:name]];
}

@end
