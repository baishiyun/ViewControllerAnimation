//
//  BSYAnimator.m
//  SmartStudy
//
//  Created by mac on 15/5/23.
//  Copyright (c) 2015年 Innobuddy Inc. All rights reserved.
//

#import "BSYAnimator.h"
#import <Foundation/Foundation.h>
@implementation BSYAnimator


/**
 *  系统切换需要花费的时间
 *
 *
 */
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0;
}

/**
 *  在这里设置转场动画

 */
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // 可以看做为前往的页面
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // 可以看做为来自那一页
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    // 添加toView到容器上
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.alpha = 0.0;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        // 动画效果有很多,这里就展示个左偏移
        fromViewController.view.transform = CGAffineTransformMakeTranslation(-320, 0);
        toViewController.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        // 别忘了在过渡结束时调用 completeTransition: 这个方法
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}


@end
