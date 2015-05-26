//
//  ViewController.h
//  ViewControllerAnimation
//
//  Created by mac on 15/5/26.
//  Copyright (c) 2015年 BSY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSYAnimator.h"
#import "BSYTransitionAnimator.h"
@interface ViewController : UIViewController

@property(nonatomic,strong)BSYAnimator *Animator;
@property(nonatomic,strong)BSYTransitionAnimator *TransitionAnimator;
@end

