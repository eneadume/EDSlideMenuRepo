//
//  DrawerMenu.swift
//  Pods
//
//  Created by Enea Dume on 6/23/17.
//
//

import UIKit

public class DrawerMenu: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet var slideRightView: UIView!
    @IBOutlet var slideRightTrailingConstraint: NSLayoutConstraint!
    @IBOutlet var leftSlideView: UIView!
    @IBOutlet var slideLeftTrailingConstraint: NSLayoutConstraint!
    @IBOutlet var dimmButton: UIButton!
    @IBOutlet var view: UIView!
    var slideViewWidth : CGFloat!
    
    
public    @IBAction func closeFromDimmButton(sender: AnyObject) {
        UIView.animate(withDuration: 0.4, animations: {
            self.slideRightTrailingConstraint.constant = 0;
            self.slideLeftTrailingConstraint.constant = -266;
            self.dimmButton.alpha = 0;
            self.view.layoutIfNeeded()
        })
    }
    
    
    @IBAction func didPanTray(sender: UIPanGestureRecognizer) {  switch (sender.state) {
    case  .ended :
        
        slideViewWidth = slideRightView.frame.size.width;
        break;
    case .changed :
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
        
        
        
    case .ended:
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
