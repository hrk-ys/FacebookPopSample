//
//  ViewController.m
//  FacebookPopSample
//
//  Created by Hiroki Yoshifuji on 2014/05/03.
//  Copyright (c) 2014年 Hiroki Yoshifuji. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;

@property (weak, nonatomic) IBOutlet UILabel *label6;

@property (nonatomic) NSArray* labels;
@end

@implementation BasicViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

    _labels = @[_label1, _label2, _label3, _label4, _label5];
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];


}
- (IBAction)start:(id)sender {
    
    NSArray* timings = @[ kCAMediaTimingFunctionDefault, kCAMediaTimingFunctionLinear, kCAMediaTimingFunctionEaseIn, kCAMediaTimingFunctionEaseOut, kCAMediaTimingFunctionEaseInEaseOut ];
    [timings enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UILabel* label = _labels[idx];

        POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionX];
        anim.timingFunction = [CAMediaTimingFunction functionWithName:obj];
        anim.fromValue = @(44.0);
        anim.toValue = @(280.0 + CGRectGetWidth(label.frame) / 2.0f);
        [label pop_addAnimation:anim forKey:@"slide"];
        anim.duration = 0.8f;
    }];

    POPDecayAnimation* anim = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anim.fromValue = @(44.0);
    anim.velocity = @(280.0 *2 + CGRectGetWidth(_label6.frame) / 2.0f);
    [_label6 pop_addAnimation:anim forKey:@"slide"];
    
    
    POPAnimationTracer *tracer = anim.tracer;
    tracer.shouldLogAndResetOnCompletion = YES;
    [tracer start];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
