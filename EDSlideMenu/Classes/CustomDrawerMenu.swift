//
//  CustomDrawerMenu.swift
//  Pods
//
//  Created by Enea Dume on 6/27/17.
//
//

import UIKit
import Foundation
public class CustomDrawerMenu: UIView {

    @IBOutlet public var contentView: UIView!
    @IBOutlet var view: UIView!
    @IBOutlet public var slideRightView: UIView!
    @IBOutlet public var leftSlideView: UIView!
    @IBOutlet public var slideRightTrailingConstraint: NSLayoutConstraint!
    @IBOutlet public var slideLeftTrailingConstraint: NSLayoutConstraint!
    @IBOutlet public var dimmButton: UIButton!
      var slideViewWidth : CGFloat!


    @IBAction public func close(sender: AnyObject) {
        UIView.animate(withDuration: 0.4, animations: {
            self.slideRightTrailingConstraint.constant = 0;
            self.slideLeftTrailingConstraint.constant = -266;
            self.dimmButton.alpha = 0;
            self.view.layoutIfNeeded();
        })
    }
    
    @IBAction func closeFromPan(sender: UIPanGestureRecognizer) {
        switch (sender.state) {
        case  .began :
            
            slideViewWidth = slideRightView.frame.size.width;
            break;
        case  .changed :
            let velocity = sender.velocity(in: view)
            let translation = sender.translation(in: view)
            
            if(velocity.x > 0){
                if(slideRightTrailingConstraint.constant + translation.x <= slideViewWidth && slideLeftTrailingConstraint.constant == -266){
                    slideRightTrailingConstraint.constant = slideRightTrailingConstraint.constant + translation.x;
                    dimmButton.alpha = slideRightTrailingConstraint.constant * 0.001 * 1.5;
                    sender.setTranslation(CGPoint.zero, in: view)
                }else
                    if(slideRightTrailingConstraint.constant == 0 && slideLeftTrailingConstraint.constant - translation.x <= 0){
                        slideLeftTrailingConstraint.constant = slideLeftTrailingConstraint.constant - translation.x;
                        dimmButton.alpha = (slideLeftTrailingConstraint.constant + 266) * 0.001 * 1.5;
                        sender.setTranslation(CGPoint.zero, in: view)
                }
            }else{
                if(slideRightTrailingConstraint.constant == 0 && slideLeftTrailingConstraint.constant - translation.x <= 0){
                    slideLeftTrailingConstraint.constant = slideLeftTrailingConstraint.constant - translation.x;
                    dimmButton.alpha = (slideLeftTrailingConstraint.constant + 266) * 0.001 * 1.5;
                    sender.setTranslation(CGPoint.zero, in: view)
                    
                }else
                    if(slideRightTrailingConstraint.constant + translation.x <= slideViewWidth && slideLeftTrailingConstraint.constant == -266){
                        slideRightTrailingConstraint.constant = slideRightTrailingConstraint.constant + translation.x;
                        dimmButton.alpha = slideRightTrailingConstraint.constant * 0.001 * 1.5;
                        sender.setTranslation(CGPoint.zero, in: view)
                }
            }
            
        case  .ended:
            if ( slideRightTrailingConstraint.constant <= slideViewWidth/2){
                UIView.animate(withDuration: 0.4, animations: {
                    self.slideRightTrailingConstraint.constant = 0
                    sender.setTranslation(CGPoint.zero, in: self.view)
                    self.dimmButton.alpha = 0;
                    self.view.layoutIfNeeded()
                })
            } else {
                UIView.animate(withDuration: 0.4, animations: {
                    self.slideRightTrailingConstraint.constant = self.slideViewWidth;
                    self.dimmButton.alpha = 0.4;
                    sender.setTranslation(CGPoint.zero, in: self.view)
                    self.view.layoutIfNeeded()
                })
                
            }
            
            if(slideLeftTrailingConstraint.constant <= -133){
                UIView.animate(withDuration: 0.4, animations: {
                    self.slideLeftTrailingConstraint.constant = -266;
                    sender.setTranslation(CGPoint.zero, in: self.view)
                    self.view.layoutIfNeeded()
                })
            }else {
                UIView.animate(withDuration: 0.4, animations: {
                    self.slideLeftTrailingConstraint.constant = 0;
                    self.dimmButton.alpha = 0.4;
                    sender.setTranslation(CGPoint.zero, in: self.view)
                    self.view.layoutIfNeeded()
                })
            }
        default:
            break;
        }
    }
    
}
