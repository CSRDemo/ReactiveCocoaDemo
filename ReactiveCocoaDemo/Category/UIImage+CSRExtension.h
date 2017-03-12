//
//  UIImage+CSRExtension.h
//  SpotlightDemo
//
//  Created by mac on 2017/2/27.
//  Copyright © 2017年 LeoAiolia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CSRExtension)
/**
 *  调整 image 到指定的大小
 *
 *  @param image  需要调整的 image
 *  @param width   调整后的宽
 *  @param height 调整后的高
 *
 *  @return 返回调整后的 image
 */
+ (UIImage *)resizeImage:(UIImage *)image toWidth:(CGFloat)width height:(CGFloat)height;
/**
 设置Image的TintColor 适用于纯色图片
 
 @param tintColor 图片所需要的颜色
 @return 颜色改变后的图片
 */
- (UIImage *)imageWithTintColor:(UIColor *)tintColor;

/**
 返回一张圆形的类似头像的图片

 @param name 图片名字
 @param borderWidth 宽度
 @param borderColor 颜色
 @return image
 */
+ (UIImage *)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

@end
