//
//  CustomDrawerMenu.m
//  EDSlideMenu
//
//  Created by Enea Dume on 6/14/17.
//  Copyright © 2017 Enea Dume. All rights reserved.
//

#import "CustomDrawerMenu.h"
#import <UIKit/UIKit.h>
#import "EDSlideMenu.h"

@interface CustomDrawerMenu()
@property (copy, nonatomic) IBInspectable NSString *myView;

@end
@implementation CustomDrawerMenu
@synthesize view ;
@synthesize slideRightView;
@synthesize slideLeftTrailingConstraint;
@synthesize slideRightTrailingConstraint;
@synthesize  slideViewWidth;
@synthesize leftSlideView;
@synthesize dimmButton;
- (IBAction)closeMenuFromDimmButton:(id)sender {
    [UIView animateWithDuration:0.4 animations:^{
        slideRightTrailingConstraint.constant = 0;
        slideLeftTrailingConstraint.constant = -266;
        dimmButton.alpha = 0;
        [view layoutIfNeeded];
    }completion:nil];
}

- (IBAction)didPanTray:(UIPanGestureRecognizer *)sender {
    
    switch (sender.state) {
        case  UIGestureRecognizerStateBegan :
        {
            slideViewWidth = slideRightView.frame.size.width;
            break;
        case UIGestureRecognizerStateChanged :
            {
                 CGPoint velocity = [sender velocityInView:view];
                const CGPoint translation = [sender translationInView:view] ;
               
                if(velocity.x > 0){
                    if(slideRightTrailingConstraint.constant + translation.x <= slideViewWidth && slideLeftTrailingConstraint.constant == -266){
                        slideRightTrailingConstraint.constant = slideRightTrailingConstraint.constant + translation.x;
                        dimmButton.alpha = slideRightTrailingConstraint.constant * 0.001 * 1.5;
                        [sender setTranslation:CGPointZero inView:view];
                    }else
                        if(slideRightTrailingConstraint.constant == 0 && slideLeftTrailingConstraint.constant - translation.x <= 0){
                            slideLeftTrailingConstraint.constant = slideLeftTrailingConstraint.constant - translation.x;
                            dimmButton.alpha = (slideLeftTrailingConstraint.constant + 266) * 0.001 * 1.5;
                            [sender setTranslation:CGPointZero inView:view];
                        }
                }else{
                    if(slideRightTrailingConstraint.constant == 0 && slideLeftTrailingConstraint.constant - translation.x <= 0){
                        slideLeftTrailingConstraint.constant = slideLeftTrailingConstraint.constant - translation.x;
                        dimmButton.alpha = (slideLeftTrailingConstraint.constant + 266) * 0.001 * 1.5;
                        [sender setTranslation:CGPointZero inView:view];
                        
                    }else
                            if(slideRightTrailingConstraint.constant + translation.x <= slideViewWidth && slideLeftTrailingConstraint.constant == -266){
                                slideRightTrailingConstraint.constant = slideRightTrailingConstraint.constant + translation.x;
                                dimmButton.alpha = slideRightTrailingConstraint.constant * 0.001 * 1.5;
                                [sender setTranslation:CGPointZero inView:view];
                                
                        }
                }
  
            }break;
            
            
        case UIGestureRecognizerStateEnded:
            if ( slideRightTrailingConstraint.constant <= slideViewWidth/2){
                [UIView animateWithDuration:0.4 animations: ^{
                    slideRightTrailingConstraint.constant = 0;
                    [sender setTranslation: CGPointZero inView:view];
                    dimmButton.alpha = 0;
                    [ view layoutIfNeeded];
                } completion:nil];
            } else {
                [UIView animateWithDuration:0.4 animations:^{
                    slideRightTrailingConstraint.constant = slideViewWidth;
                    dimmButton.alpha = 0.4;
                    [ view layoutIfNeeded];
                }completion:nil];
            }
            
            if(slideLeftTrailingConstraint.constant <= -133){
                [UIView animateWithDuration:0.4 animations:^{
                    slideLeftTrailingConstraint.constant = -266;
                   // dimmButton.alpha = (slideLeftTrailingConstraint.constant + 266) * 0.001 * 1.5;
                    [sender setTranslation: CGPointZero inView:view];
                    [ view layoutIfNeeded];
                }];
            }else {
                [UIView animateWithDuration:0.4 animations:^{
                    slideLeftTrailingConstraint.constant = 0;
                    dimmButton.alpha = 0.4;
                    [ view layoutIfNeeded];
                }];
            }
        default:
            break;
        }
            
    }
}
@end

