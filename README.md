在需要使用的控制器中添加#import "BSYAnimator.h"和#import "BSYTransitionAnimator.h"两个头文件：

@property(nonatomic,strong)BSYAnimator *Animator;
@property(nonatomic,strong)BSYTransitionAnimator *TransitionAnimator;
///遵循代理
@interface ViewController ()<UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>
///需要跳转的控制器
@property(nonatomic,strong)TwoViewController*two;

在- (void)viewDidLoad 中初始化

self.Animator = [[BSYAnimator alloc]init];
self.TransitionAnimator = [[BSYTransitionAnimator alloc]init];
TwoViewController *two = [[TwoViewController alloc]init];
self.navigationController.delegate = self;
two.transitioningDelegate = self;
two.modalPresentationStyle = UIModalPresentationCustom;

／／然后在跳转的方法中
  [self.navigationController pushViewController:self.two animated:YES];
  
实现代理方法
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




