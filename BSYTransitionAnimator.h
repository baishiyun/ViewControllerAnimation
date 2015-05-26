//
//  BSYTransitionAnimator.h
//  SmartStudy
//
//  Created by mac on 15/5/23.
//  Copyright (c) 2015年 Innobuddy Inc. All rights reserved.
//
typedef enum {
    AnimationTypePresent,
    AnimationTypeDismiss
} AnimationType;

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface BSYTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign) AnimationType animationType;
@end
