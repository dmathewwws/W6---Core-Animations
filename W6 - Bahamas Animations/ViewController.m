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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.username.center = CGPointMake(self.username.center.x - self.view.frame.size.width, self.username.center.y);
    
    
    self.password.center = CGPointMake(self.username.center.x - self.view.frame.size.width, self.password.center.y);
    
    [UIView animateWithDuration:1.0 animations:^{
        
        self.username.center = CGPointMake( CGRectGetMidX(self.view.frame), self.username.center.y);

        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            self.password.center = CGPointMake( CGRectGetMidX(self.view.frame), self.password.center.y);
            
            
        } completion:nil];
        
    }];
    
    self.plusButton.center = CGPointMake(self.plusButton.center.x, self.plusButton.center.y - self.view.frame.size.height);
    
    [UIView animateWithDuration:1.0 delay:2.0 usingSpringWithDamping:0.8 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.plusButton.center = CGPointMake(self.plusButton.center.x, self.plusButton.center.y + self.view.frame.size.height);
        
        self.plusButton.transform = CGAffineTransformMakeRotation(M_PI_4);
        
    } completion:nil];
    
    self.loginLabel.hidden = YES;
    
    [UIView transitionWithView:self.loginLabel duration:2               options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
    
    
        self.loginLabel.hidden = NO;
    
    } completion:^(BOOL finished) {
        //
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
