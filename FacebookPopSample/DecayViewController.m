//
//  ViewController3.m
//  FacebookPopSample
//
//  Created by Hiroki Yoshifuji on 2014/05/05.
//  Copyright (c) 2014年 Hiroki Yoshifuji. All rights reserved.
//

#import "DecayViewController.h"

@interface DecayViewController ()
@property (weak, nonatomic) IBOutlet UIView *outletView;
@property (weak, nonatomic) IBOutlet UISlider *decelerationSlider;
@property (weak, nonatomic) IBOutlet UILabel *decelerationLabel;

@end

@implementation DecayViewController

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

- (IBAction)pan:(UIPanGestureRecognizer*)recognizer {
    
    CGPoint velocity = [recognizer velocityInView:self.view];
    
    NSLog(@"%@", NSStringFromCGPoint(velocity));

    POPDecayAnimation *positionAnimation = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    positionAnimation.velocity = [NSNumber numberWithFloat:velocity.y];
    positionAnimation.deceleration = _decelerationSlider.value;

    [_outletView.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];

}

- (IBAction)decelerationSliderValueChange:(id)sender {
    _decelerationLabel.text = [NSString stringWithFormat:@"%f", _decelerationSlider.value];
}

@end
