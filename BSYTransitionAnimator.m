//
//  BSYTransitionAnimator.m
//  SmartStudy
//
//  Created by mac on 15/5/23.
//  Copyright (c) 2015年 Innobuddy Inc. All rights reserved.
//

#import "BSYTransitionAnimator.h"

@implementation BSYTransitionAnimator
#define Switch_Time 1.2
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return Switch_Time;
}

#define Button_Width 50.f
#define Button_Space 10.f
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView * toView = toViewController.view;
    UIView * fromView = fromViewController.view;
    
    if (self.animationType == AnimationTypeDismiss) {

        UIView * snap = [toView snapshotViewAfterScreenUpdates:YES];
        [transitionContext.containerView addSubview:snap];
        [snap setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - Button_Width - Button_Space, [UIScreen mainScreen].bounds.size.height - Button_Width - Button_Space, Button_Width, Button_Width)];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            [snap setFrame:[UIScreen mainScreen].bounds];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                [[transitionContext containerView] addSubview:toView];
                snap.alpha = 0;
            } completion:^(BOOL finished) {
                [snap removeFromSuperview];
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];
        }];
    } else {
        UIView * snap2 = [toView snapshotViewAfterScreenUpdates:YES];
        [transitionContext.containerView addSubview:snap2];
        UIView * snap = [fromView snapshotViewAfterScreenUpdates:YES];
        [transitionContext.containerView addSubview:snap];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            [snap setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - Button_Width - Button_Space+ (Button_Width/2), [UIScreen mainScreen].bounds.size.height - Button_Width - Button_Space + (Button_Width/2), 0, 0)];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                //snap.alpha = 0;
            } completion:^(BOOL finished) {
                [snap removeFromSuperview];
                [snap2 removeFromSuperview];
                [[transitionContext containerView] addSubview:toView];
                
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];
        }];
        
    }
}

@end
