//
//  ButtonViewController.m
//  FacebookPopSample
//
//  Created by Hiroki Yoshifuji on 2014/05/05.
//  Copyright (c) 2014年 Hiroki Yoshifuji. All rights reserved.
//

#import "ButtonViewController.h"

@interface ButtonViewController ()
@property (nonatomic) BOOL buttonToggle;
@property (nonatomic) BOOL buttonToggle2;
@property (nonatomic) BOOL menuToggle;

@property (weak, nonatomic) IBOutlet UIView *menuBar1;
@property (weak, nonatomic) IBOutlet UIView *menuBar2;
@property (weak, nonatomic) IBOutlet UIView *menuBar3;


@end

@implementation ButtonViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)tappedCrossButton:(UIButton *)button {
    
    POPSpringAnimation* anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewSize];
    POPSpringAnimation* rotate = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
    
    _buttonToggle = !_buttonToggle;

    if (_buttonToggle) {
        anim.toValue = [NSValue valueWithCGSize:CGSizeMake(45.0f, 45.0f)];
        rotate.toValue = @(M_PI_4);
        button.tintColor = [UIColor blueColor];
    } else {
        anim.toValue = [NSValue valueWithCGSize:CGSizeMake(35.0f, 35.0f)];
        rotate.toValue = @0;
        button.tintColor = [UIColor redColor];
    }
    anim.springBounciness = 20.0f;
    anim.springSpeed = 20.0f;

    [button.layer pop_addAnimation:anim forKey:@"size"];
    [button.layer pop_addAnimation:rotate forKey:@"rotate"];
}

- (IBAction)tappedMenuView:(id)sender {
    
    _menuToggle = !_menuToggle;

    POPSpringAnimation* rotate1 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
    POPBasicAnimation* positionY1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];

    POPBasicAnimation* alpha2 = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];


    POPSpringAnimation* rotate3 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
    POPBasicAnimation* positionY3 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];

    if (_menuToggle) {
        rotate1.toValue = @(M_PI_4);
        positionY1.toValue = @(22);

        alpha2.toValue = @(0);
        
        rotate3.toValue = @(- M_PI_4);
        positionY3.toValue = @(22);
        
    } else {
        rotate1.toValue = @(0);
        positionY1.toValue = @(6);

        alpha2.toValue = @(1);
        
        rotate3.toValue = @(0);
        positionY3.toValue = @(39);
    }

    rotate1.springBounciness = 20.0f;
    rotate1.springSpeed = 20.0f;

    rotate3.springBounciness = 20.0f;
    rotate3.springSpeed = 20.0f;

    
    [_menuBar1.layer pop_addAnimation:rotate1    forKey:@"rotate1"];
    [_menuBar1.layer pop_addAnimation:positionY1 forKey:@"positionY1"];
    
    [_menuBar2 pop_addAnimation:alpha2 forKey:@"alpha2"];
    
    [_menuBar3.layer pop_addAnimation:rotate3    forKey:@"rotate3"];
    [_menuBar3.layer pop_addAnimation:positionY3 forKey:@"positionY3"];

}


- (IBAction)tappedCrossButton2:(UIButton*)button {

    _buttonToggle2 = !_buttonToggle2;

    CGRect frame = button.frame;
    CGAffineTransform transform = CGAffineTransformIdentity;
    CATransform3D transform3D = CATransform3DIdentity;
    UIColor* tintColor;

    if (_buttonToggle2) {
        frame.origin = CGPointMake(0, 262);
//        frame.size = CGSizeMake(45.0f, 45.0f);
        button.frame = frame;
        transform = CGAffineTransformTranslate(transform, -25, 0);
        transform = CGAffineTransformRotate(transform, M_PI_4);
        transform = CGAffineTransformScale(transform, 1.3, 1.3);
        transform3D = CATransform3DMakeScale(1.3, 1.3, 0);
//        transform3D = CATransform3DScale(transform3D, 1.3, 1.3, 0);
//        transform3D = CATransform3DRotate(transform3D, M_PI, 0, 0, 1.0f);
//        transform3D = CATransform3DRotation(transform3D, M_PI_4, .0, 0, 1.0);
                                          ;

        tintColor = [UIColor blueColor];
    } else {
//        frame.origin = CGPointMake(145, 269);
        frame.size = CGSizeMake(30.0f, 30.0f);
        transform = CGAffineTransformIdentity;
        tintColor = [UIColor redColor];
    }

    [UIView animateWithDuration:1.4f
                          delay:0
         usingSpringWithDamping:0.5
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
//                         button.frame = frame;
                         button.transform = transform;
//                         button.layer.transform = transform3D;
                         button.tintColor = tintColor;
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"%@", NSStringFromCGRect(button.frame));
                     }];
    
}

@end
