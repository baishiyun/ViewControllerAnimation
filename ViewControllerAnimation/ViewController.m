//
//  ViewController.m
//  ViewControllerAnimation
//
//  Created by mac on 15/5/26.
//  Copyright (c) 2015年 BSY. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"
@interface ViewController ()<UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>
@property(nonatomic,strong)TwoViewController*two;
@property(nonatomic,strong)UIViewController *currentViewController;;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"第一页";
    self.view.backgroundColor = [UIColor grayColor];
    self.Animator = [[BSYAnimator alloc]init];
    self.TransitionAnimator = [[BSYTransitionAnimator alloc]init];
    
    UIButton *button  = [UIButton buttonWithType: UIButtonTypeCustom];
    [button setFrame:CGRectMake(100, 100, 100, 100)];
    [button setTitle:@"Push" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    TwoViewController *two = [[TwoViewController alloc]init];
    self.two = two;
    self.navigationController.delegate = self;
    two.transitioningDelegate = self;
    two.modalPresentationStyle = UIModalPresentationCustom;
    
    [self addChildViewController:two];
    self.currentViewController = two;
}

-(void)buttonClick
{
    [self.navigationController pushViewController:self.two animated:YES];
}

#pragma mark - UINavigationControllerDelegate iOS7新增的2个方法
// 动画特效
- (id<UIViewControllerAnimatedTransitioning>) navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    
    if (operation == UINavigationControllerOperationPush) {
        return self.Animator;
    }else{
        return nil;
    }
}
#pragma mark - Transitioning Delegate (Modal)
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.TransitionAnimator.animationType = AnimationTypePresent;
    return self.TransitionAnimator;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.TransitionAnimator.animationType = AnimationTypeDismiss;
    return self.TransitionAnimator;
}

@end
