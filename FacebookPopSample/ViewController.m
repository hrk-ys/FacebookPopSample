//
//  ViewController.m
//  FacebookPopSample
//
//  Created by Hiroki Yoshifuji on 2014/05/03.
//  Copyright (c) 2014年 Hiroki Yoshifuji. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;


@property (weak, nonatomic) IBOutlet UILabel *labelA;
@property (weak, nonatomic) IBOutlet UILabel *labelB;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];


}
- (IBAction)start:(id)sender {
    
    POPSpringAnimation *anim1 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    anim1.toValue = [NSValue valueWithCGRect:CGRectMake(80, 200, 45, 45)];
    [_label1.layer pop_addAnimation:anim1 forKey:@"myKey"];

    POPDecayAnimation *anim2 = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anim2.velocity = @(400.);
    [_label2.layer pop_addAnimation:anim2 forKey:@"slide"];
    
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.fromValue = @(1.0);
    anim.toValue = @(0.0);
    [_label3 pop_addAnimation:anim forKey:@"fade"];
    
    
    [UIView animateKeyframesWithDuration:1.5
                                   delay:0
                                 options:UIViewAnimationOptionCurveEaseOut
                              animations:^{
                                  _labelA.frame = CGRectOffset(_labelA.frame, 160, 0);
                              }
                              completion:nil];
    
    [UIView animateWithDuration:1.0f
                     animations:^{
                         _labelB.frame = CGRectOffset(_labelB.frame, 160, 0);
                     }];

}
- (IBAction)reset:(id)sender {

    _label1.frame = CGRectMake(20, 20, 100, 21);

    _label2.frame = CGRectMake(20, 49, 100, 21);

    _label3.alpha = 1.0f;
    
    _labelA.frame = CGRectMake(20, 273, 100, 21);

    _labelB.frame = CGRectMake(20, 302, 100, 21);

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
