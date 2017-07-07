//
//  NYTExamplePhotoContent.h
//  NYTPhotoViewer
//
//  Created by Андрей on 07.07.17.
//  Copyright © 2017 NYTimes. All rights reserved.
//

@import UIKit;
#import "NYTPhotoContent.h"

@interface NYTExamplePhotoContent : NSObject <NYTPhotoContent>
@property (nonatomic) UIImage *image;
@property (nonatomic) NSData *imageData;
- (instancetype)initWithImageData:(NSData *)imageData;
+ (instancetype)contentNamed:(NSString *)name;
@end
