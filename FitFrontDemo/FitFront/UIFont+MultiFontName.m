//
//  UIFont+MultiFontName.m
//  FitFrontDemo
//
//  Created by LiuLi on 2019/2/25.
//  Copyright © 2019年 LYPC. All rights reserved.
//

#import "UIFont+MultiFontName.h"
#import <objc/runtime.h>

#import "MultiFont.h"

@implementation UIFont (MultiFontName)

+ (void)load {
    Method method0 = class_getClassMethod(self, @selector(fontWithName:size:));
    Method method1 = class_getClassMethod(self, @selector(ct_fontWithName:size:));
    method_exchangeImplementations(method0, method1);
}

+ (UIFont *)ct_fontWithName:(NSString *)fontName size:(CGFloat)fontSize {
    NSString *size = [[NSUserDefaults standardUserDefaults] objectForKey:FontChangeValue];
    if ([size isKindOfClass:[NSNull class]] || size == nil || size.length == 0) {
        size = [NSString stringWithFormat:@"%@", @(fontSize)];
    }
    int changeSize = [size intValue];
    int resultSize = fontSize+changeSize > 0 ? fontSize+changeSize : fontSize;
    return [self ct_fontWithName:fontName size:resultSize];
}

@end
