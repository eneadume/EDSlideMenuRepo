
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
        self.topAnchor.constraint(equalTo: self.superview!.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: self.superview!.bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor, constant: 0).isActive = true
        self.trailingAnchor.constraint(equalTo: self.superview!.trailingAnchor, constant: 0).isActive = true
        
        UIView.animate(withDuration: 0.4, animations: {
            self.alpha = 1
        })
    }
    
}

extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
