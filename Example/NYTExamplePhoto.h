//
//  NYTExamplePhoto.h
//  ios-photo-viewer
//
//  Created by Brian Capps on 2/11/15.
//  Copyright (c) 2015 NYTimes. All rights reserved.
//

@import Foundation;

#import <NYTPhotoViewer/NYTPhoto.h>

@interface NYTExamplePhoto : NSObject <NYTPhoto>

// Redeclare all the properties as readwrite for sample/testing purposes.
@property (nonatomic) PhotoObject *image;
@property (nonatomic) NSData *imageData;
@property (nonatomic) PhotoObject *placeholderImage;
@property (nonatomic) NSAttributedString *attributedCaptionTitle;
@property (nonatomic) NSAttributedString *attributedCaptionSummary;
@property (nonatomic) NSAttributedString *attributedCaptionCredit;

@end
