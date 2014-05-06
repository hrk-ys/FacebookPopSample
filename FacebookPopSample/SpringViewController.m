//
//  ViewController2.m
//  FacebookPopSample
//
//  Created by Hiroki Yoshifuji on 2014/05/05.
//  Copyright (c) 2014年 Hiroki Yoshifuji. All rights reserved.
//

#import "SpringViewController.h"

@interface SpringViewController ()
@property (weak, nonatomic) IBOutlet UIView *outletView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *seg;

@end

@implementation SpringViewController

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
- (IBAction)rotate:(UIPanGestureRecognizer*)recognizer {
    
    CGPoint velocity = [recognizer velocityInView:self.view];
    
    NSLog(@"%@", NSStringFromCGPoint(velocity));
    
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    positionAnimation.velocity = [NSValue valueWithCGPoint:velocity];
    if (_seg.selectedSegmentIndex == 0) {
        positionAnimation.dynamicsTension = 5;
        positionAnimation.dynamicsFriction = 5.0f;
        positionAnimation.springBounciness = 20.0f;
    }
    [_outletView.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    
    
    POPSpringAnimation *sizeAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
    sizeAnimation.velocity = [NSValue valueWithCGPoint:velocity];
    if (_seg.selectedSegmentIndex == 0) {
        sizeAnimation.springBounciness = 2.0f;
        sizeAnimation.dynamicsFriction = 1.0f;
    }
    
    [_outletView.layer pop_addAnimation:sizeAnimation forKey:@"sizeAnimation"];
}

@end
