//
//  UIImage+SplitImage.m
//  Common
//
//  Created by leeje on 12/07/12.
//  Copyright (c) 2012年 kj-code. All rights reserved.
//

#import "UIImage+SplitImage.h"

@implementation UIImage (SplitImage)

+(NSMutableArray *)getSplitImagesFromImage:(UIImage *)image withRow:(NSInteger)rows withColumn:(NSInteger)columns {
    
    NSMutableArray *images = [NSMutableArray array];
    CGSize imageSize = image.size;
    CGFloat xPos = 0.0, yPos = 0.0;
    CGFloat width = imageSize.width/rows;
    CGFloat height = imageSize.height/columns;
    for (int y = 0; y < columns; y++) {
        xPos = 0.0;
        for (int x = 0; x < rows; x++) {
            
            CGRect rect = CGRectMake(xPos, yPos, width, height);
            CGImageRef cImage = CGImageCreateWithImageInRect([image CGImage],  rect);
            
            UIImage *dImage = [[UIImage alloc] initWithCGImage:cImage];
            [images addObject:dImage];
            [dImage release];
            xPos += width;
        }
        yPos += height;
    }
    return images;
}   

+(NSMutableArray *)getSplitImagesFromImageNamed:(NSURL *)imageURL withRow:(NSInteger)rows withColumn:(NSInteger)columns {
    
    NSError *err = nil;
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL options:nil error:&err];
    
    if (err != nil) {
        UIImage *image = [UIImage imageWithData:imageData];
        
        return [self getSplitImagesFromImage:image withRow:rows withColumn:columns];
    }
    
    return nil;
}   

@end
