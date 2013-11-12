//
//  UIImage+SplitImage.h
//  Common
//
//  Created by leeje on 12/07/12.
//  Copyright (c) 2012年 kj-code. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SplitImage)

+(NSMutableArray *)getSplitImagesFromImage:(UIImage *)image withRow:(NSInteger)rows withColumn:(NSInteger)columns;
+(NSMutableArray *)getSplitImagesFromImageNamed:(NSURL *)imageURL withRow:(NSInteger)rows withColumn:(NSInteger)columns;

@end
