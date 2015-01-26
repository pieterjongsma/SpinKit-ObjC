//
//  RTSpinKitPJLogoAnimation.m
//  SpinKit
//
//  Created by Pieter Jongsma on 26-01-15.
//  Copyright (c) 2015 Ramon Torres. All rights reserved.
//

#import "RTSpinKitPJLogoAnimation.h"

@implementation RTSpinKitPJLogoAnimation

- (void)setupSpinKitAnimationInLayer:(CALayer*)layer withSize:(CGSize)size color:(UIColor*)color
{
    // Positions:
    //
    // - - - 1
    // - 0 - 2
    // - - - 3
    // 7 6 5 4

    NSTimeInterval beginTime = CACurrentMediaTime();

    CGFloat squareSize = size.width / 4;

    for (NSInteger position = 0; position < 8; position++) {
        NSInteger x = [self xForPosition:position];
        NSInteger y = [self yForPosition:position];

        CALayer *square = [CALayer layer];
        square.frame = CGRectMake(x * squareSize, y * squareSize, squareSize, squareSize);
        square.backgroundColor = color.CGColor;
        square.transform = CATransform3DMakeScale(0.0, 0.0, 0.0);

        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        anim.removedOnCompletion = NO;
        anim.repeatCount = HUGE_VALF;
        anim.duration = 1.5;
        anim.beginTime = beginTime + (0.1 * position);
        anim.keyTimes = @[@(0.0), @(0.4), @(0.6), @(1.0)];

        anim.timingFunctions = @[
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                 ];

        anim.values = @[
                        [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0, 0.0, 0.0)],
                        [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 0.0)],
                        [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 0.0)],
                        [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0, 0.0, 0.0)]
                        ];

        [layer addSublayer:square];
        [square addAnimation:anim forKey:@"spinkit-anim"];
    }
}

- (NSInteger)xForPosition:(NSInteger)position
{
    switch (position) {
        case 7:
            return 0;
            break;
        case 0:
        case 6:
            return 1;
            break;
        case 5:
            return 2;
            break;
        case 1:
        case 2:
        case 3:
        case 4:
            return 3;
        default:
            return -1;
            break;
    }
}
- (NSInteger)yForPosition:(NSInteger)position
{
    switch (position) {
        case 1:
            return 0;
            break;
        case 0:
        case 2:
            return 1;
            break;
        case 3:
            return 2;
            break;
        case 7:
        case 6:
        case 5:
        case 4:
            return 3;
            break;
        default:
            return -1;
            break;
    }
}

@end