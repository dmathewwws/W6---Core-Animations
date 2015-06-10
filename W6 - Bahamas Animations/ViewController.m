//
//  ViewController.m
//  W6 - Bahamas Animations
//
//  Created by Daniel Mathews on 2015-06-06.
//  Copyright (c) 2015 ca.lighthouselabs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *cloud1;
@property (weak, nonatomic) IBOutlet UIButton *plusButton;
@property (weak, nonatomic) IBOutlet UILabel *loginLabel;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CABasicAnimation *moveToCenter = [CABasicAnimation animation];
    moveToCenter.keyPath = @"position.x";
    moveToCenter.fromValue = [NSNumber numberWithFloat:-CGRectGetMidX(self.view.frame)];
    moveToCenter.toValue = [NSNumber numberWithFloat:CGRectGetMidX(self.view.frame)];
    moveToCenter.duration = 1.0;
    moveToCenter.delegate = self;
    
    [self.username.layer addAnimation:moveToCenter forKey:@"usernameAppear"];
    self.username.layer.position = CGPointMake(CGRectGetMidX(self.view.frame), self.username.center.y);
    
    moveToCenter.beginTime = CACurrentMediaTime() + 0.5;
    moveToCenter.fillMode = kCAFillModeBoth;
    
    [self.password.layer addAnimation:moveToCenter forKey:@"passwordAppear"];

}

- (IBAction)loginButtonPressed:(UIButton *)sender {
    
    CAKeyframeAnimation *shakeyShakey = [CAKeyframeAnimation animation];
    shakeyShakey.keyPath = @"position.x";
    shakeyShakey.values = @[ @0, @10, @-10, @10, @0 ];
    shakeyShakey.keyTimes = @[ @0, @(2/5.0), @(3/5.0), @(4/5.0), @1 ];
    shakeyShakey.duration = 0.4;
    shakeyShakey.repeatCount = 1;
    [shakeyShakey setValue:@"shakeyShakey" forKey:@"name"];
    [shakeyShakey setValue:self.loginButton.layer forKey:@"layer"];
    shakeyShakey.delegate = self;
    
    shakeyShakey.additive = YES;
    
    [self.password.layer addAnimation:shakeyShakey forKey:@"passwordShake"];
    
}

-(void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"animation DID START");
    if ([[anim valueForKey:@"name"] isEqualToString:@"shakeyShakey"]){
        NSLog(@"inside shakeyShakey");
    }
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"animation DID STOP");
    
    if ([[anim valueForKey:@"name"] isEqualToString:@"shakeyShakey"]){
        
        CALayer *layer = [anim valueForKey:@"layer"];
        [anim setValue:nil forKey:@"layer"];
        
        CABasicAnimation *pulseAnimation = [CABasicAnimation animation];
        pulseAnimation.keyPath = @"transform.scale";
        pulseAnimation.fromValue = @1.25;
        pulseAnimation.toValue = @1.0;
        pulseAnimation.duration = 0.5;

        [layer addAnimation:pulseAnimation forKey:nil];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
