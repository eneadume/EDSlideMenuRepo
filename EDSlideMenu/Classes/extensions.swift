//
//  extensions.swift
//  Pods
//
//  Created by Enea Dume on 6/23/17.
//
//

import Foundation
import UIKit

public extension UIView{
    
    class func instanceFromNib(name:String, fromBundle bundle : Bundle? = nil) -> UIView {
        return UINib(nibName: name, bundle: bundle).instantiate(withOwner: self, options: nil)[0] as! UIView
    }
    
    public func print( _ text : String){
        print(text);
    }
    
    static public func createView<T : UIView>(attachTo view : UIView? = nil, fromBundle bundle : Bundle? = Bundle.main) -> T{
        
        let popup = UIView.instanceFromNib(name: String(describing: T.self), fromBundle: bundle) as? T
        
        if(view != nil){
            popup!.attachTo(view : view!)
        }
        
        return popup!
    }
    
    public func attachTo(view : UIView){
        
        self.alpha = 0
        view.addSubview(self)
        // self.frame = view.bounds
        
        self.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 9.0, *) {
            self.topAnchor.constraint(equalTo: self.superview!.topAnchor).isActive = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 9.0, *) {
            self.bottomAnchor.constraint(equalTo: self.superview!.bottomAnchor).isActive = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 9.0, *) {
            self.leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor, constant: 0).isActive = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 9.0, *) {
            self.trailingAnchor.constraint(equalTo: self.superview!.trailingAnchor, constant: 0).isActive = true
        } else {
            // Fallback on earlier versions
        }
        
        UIView.animate(withDuration: 0.4, animations: {
            self.alpha = 1
        })
    }
    
}
