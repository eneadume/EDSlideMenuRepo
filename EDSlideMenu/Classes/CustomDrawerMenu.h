//
//  CustomDrawerMenu.h
//  EDSlideMenu
//
//  Created by Enea Dume on 6/14/17.
//  Copyright © 2017 Enea Dume. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface  CustomDrawerMenu : UIView
@property (strong, nonatomic) IBOutlet UIView *view;
@property (strong, nonatomic) IBOutlet UIView *slideRightView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *slideRightTrailingConstraint;
@property (strong, nonatomic) IBOutlet UIView *leftSlideView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *slideLeftTrailingConstraint;
@property (strong, nonatomic) IBOutlet UIButton *dimmButton;
@property (nonatomic)     CGFloat  slideViewWidth;
@property (strong, nonatomic) IBOutlet UIView *contentView;


@end
