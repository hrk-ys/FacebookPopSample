//
//  ViewController4.m
//  FacebookPopSample
//
//  Created by Hiroki Yoshifuji on 2014/05/05.
//  Copyright (c) 2014年 Hiroki Yoshifuji. All rights reserved.
//

#import "CustomViewController.h"

@interface CustomViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label1;
@end

@implementation CustomViewController

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
- (IBAction)start:(id)sender {
    
    POPCustomAnimation* anim = [POPCustomAnimation animationWithBlock:^BOOL(id target, POPCustomAnimation *animation) {
        
        float t = (animation.currentTime-animation.beginTime);

        UILabel* label = target;
        
        CGRect frame = label.frame;
        frame.origin.x = 20 + t * 280;
        frame.origin.y = (t<0.5) ? 100 +    t  * 100
                                 : 100 + (1-t) * 100;
        label.frame = frame;

        return t < 1.0f;
    }];
    [_label1 pop_addAnimation:anim forKey:@"custom"];
    
    
}

@end
