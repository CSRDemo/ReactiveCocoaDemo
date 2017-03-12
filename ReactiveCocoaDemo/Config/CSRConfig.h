//
//  CSRConfig.h
//  SpotlightDemo
//
//  Created by mac on 2017/2/27.
//  Copyright © 2017年 LeoAiolia. All rights reserved.
//

#ifndef CSRConfig_h
#define CSRConfig_h

#define CSRScreenFrame [[UIScreen mainScreen] bounds]
/**     屏幕高     */
#define CSRScreenHeight (CSRScreenFrame.size.height)
/**     屏幕宽     */
#define CSRScreenWidth (CSRScreenFrame.size.width)
/**     屏幕中心点  */
#define CSRScreenCenter CGPointMake(CGRectGetMidX(CSRScreenFrame), CGRectGetMidX(CSRScreenFrame))
/**     判断系统版本号是否是iOS8以上   */
#define iOS8 [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0
/**     消除自定义的警告信息   */
#pragma clang diagnostic ignored "-W#warnings"

/**     如果是 debug 状态，可以使用 CSRLog()来代替 NSLog（）否则就将其制空  */
#ifdef DEBUG
//#define CSRLog(format, ...) CFShow((__bridge CFTypeRef)[NSString stringWithFormat:format, ## __VA_ARGS__]);
#define CSRLog(...) NSLog(__VA_ARGS__)
#else
#define CSRLog(...)
#endif


/**
 *  自定义颜色 RGB
 *
 *  @param r 红  0<r<255
 *  @param g 绿  0<g<255
 *  @param b 蓝  0<b<255
 *  @param a 透明度  0<a<1
 */
#define CSRColor(r,g,b,a) [UIColor colorWithRed:((r)/255.0) green:((g)/255.0) blue:((b)/255.0) alpha:a]
#define CSRRandomColor [UIColor colorWithRed:arc4random()%256/255.f green:arc4random()%256/255.f blue:arc4random()%256/255.f alpha:1.f]

/**     定一个弱引用的指针weakSelf指向本类       */
#define CSRWeakSelf(weakSelf) __weak __typeof(&*self)weakSelf = self



#endif /* CSRConfig_h */
