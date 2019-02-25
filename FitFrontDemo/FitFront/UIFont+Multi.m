//
//  UIFont+Multi.m
//  IBDP
//
//  Created by LYPC on 2018/1/16.
//  Copyright © 2018年 cattsoft. All rights reserved.
//

#import "UIFont+Multi.h"
#import <objc/runtime.h>

#import "MultiFont.h"

@implementation UIFont (Multi)

+ (void)load {
    Method method0 = class_getClassMethod(self, @selector(systemFontOfSize:));
    Method method1 = class_getClassMethod(self, @selector(ct_systemFontOfSize:));
    method_exchangeImplementations(method0, method1);
}

+ (UIFont *)ct_systemFontOfSize:(CGFloat)fontSize {
    NSString *size = [[NSUserDefaults standardUserDefaults] objectForKey:FontChangeValue];
    if ([size isKindOfClass:[NSNull class]] || size == nil || size.length == 0) {
        size = [NSString stringWithFormat:@"%@", @(fontSize)];
    }
    int changeSize = [size intValue];
    int resultSize = fontSize+changeSize > 0 ? fontSize+changeSize : fontSize;
    return [self ct_systemFontOfSize:resultSize];
}

@end
