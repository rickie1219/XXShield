//
//  NSCache+Shield.m
//  Shield
//
//  Created by nero on 2017/1/19.
//  Copyright © 2017年 XXShield. All rights reserved.
//

#import "NSCache+Shield.h"
#import "XXRecord.h"
#import "XXShieldSwizzling.h"

@implementation NSCache (Shield)
XXStaticHookClass(NSCache, ProtectCont, void, @selector(setObject:forKey:),(id)obj, (id)key) {
    if (obj && key) {
        XXHookOrgin(obj,key);
    } else {
        NSString *reason = [NSString stringWithFormat:@"target is %@ method is %@, reason : ket or value appear nil- key is %@, obj is %@",
                            [self class], XXSEL2Str(@selector(setObject:forKey:)),key, obj];
        [XXRecord recordFatalWithReason:reason userinfo:nil errorType:(EXXShieldTypeContainer)];
    }
}
XXStaticHookEnd

XXStaticHookClass(NSCache, ProtectCont, void, @selector(setObject:forKey:cost:), (id)obj, (id)key, (NSUInteger)g ) {
    if (obj && key) {
        XXHookOrgin(obj,key,g);
    } else {
        NSString *reason = [NSString stringWithFormat:@"target is %@ method is %@, reason : ket or value appear nil- key is %@, obj is %@",
                            [self class], XXSEL2Str(@selector(setObject:forKey:cost:)), key, obj];
        [XXRecord recordFatalWithReason:reason userinfo:nil errorType:(EXXShieldTypeContainer)];
    }
}
XXStaticHookEnd


@end
