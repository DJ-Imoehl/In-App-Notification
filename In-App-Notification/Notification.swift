//
//  Notification.swift
//  Circle
//
//  Created by Student on 3/27/19.
//  Copyright © 2019 Imoehl Innovations. All rights reserved.
//

import UIKit

enum NotificationTheme: Int{
    case Normal
    case Dark
    case Light
}

enum NotificationType: Int{
    case Error
    case Success
    case Warning
    case Information
}

class Notification {
    //MARK: Definitions
    var view: UIView = {
        let v = UIView(frame: CGRect(x: 20, y: UIScreen.main.bounds.size.height + 60, width: UIScreen.main.bounds.size.width - 40, height: 50))
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 5
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.lightGray.cgColor
        v.isUserInteractionEnabled = true
        
        return v
    }()
    
    var notificationLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 40, height: 50))
        label.text = ""
        
        label.numberOfLines = 0
        return label
    }()
    
    var backgroundView: UIView = {
        let v = UIView(frame: CGRect(x: 15, y: 0, width: UIScreen.main.bounds.size.width - 60, height: 50))
        v.backgroundColor = UIColor.blue
        v.isUserInteractionEnabled = true
        
        return v
    }()
    
    var decorationView: UIView = {
        let dv = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        dv.backgroundColor = UIColor.red
        dv.layer.cornerRadius = 5
        dv.isUserInteractionEnabled = true
        return dv
    }()
    
    
    //MARK: Functions
    func show(parent parentView: UIView, ofType type: NotificationType, ofTheme theme: NotificationTheme, withMessage message: String){
        
        setupNotification(parentView, message, type, theme)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseIn, .allowUserInteraction], animations: {
            self.view.center.y -= 130
            parentView.layoutIfNeeded()
        }, completion: { error in
            self.hide(parent: parentView, timeDelay: 3.0)
            
        })
        
    }
    
    func show(parent parentView: UIView, ofType type: NotificationType, ofTheme theme: NotificationTheme, withMessage message: String, withDelay delay: Float){
        setupNotification(parentView, message, type, theme)
        
        UIView.animate(withDuration: 0.5, delay: TimeInterval(delay), options: [.curveEaseIn, .allowUserInteraction], animations: {
            self.view.center.y -= 130
            parentView.layoutIfNeeded()
        }, completion: { error in
            self.hide(parent: parentView, timeDelay: 3.0)
            
        })
        
    }
    
    private func setupNotification(_ parentView: UIView, _ message: String, _ type: NotificationType, _ theme: NotificationTheme){
        notificationLabel.text = message
        
        switch type{
        case .Error:
            decorationView.backgroundColor = UIColor.init(red: 184/255, green: 15/255, blue: 10/255, alpha: 1.0)
        case .Success:
            decorationView.backgroundColor = UIColor.init(red: 76/255, green: 187/255, blue: 23/255, alpha: 1.0)
        case .Warning:
            decorationView.backgroundColor = UIColor.init(red: 255/255, green: 223/255, blue: 0/255, alpha: 1.0)
        case .Information:
            decorationView.backgroundColor = UIColor.init(red: 0/255, green: 128/255, blue: 255/255, alpha: 1.0)
        }
        
        switch theme{
        case .Dark:
            backgroundView.backgroundColor = UIColor.darkGray
            view.layer.borderColor = UIColor.lightGray.cgColor
            view.backgroundColor = UIColor.darkGray
            notificationLabel.textColor = UIColor.white
        case .Light:
            backgroundView.backgroundColor = UIColor.white
            view.layer.borderColor = UIColor.lightGray.cgColor
        case .Normal:
            backgroundView.backgroundColor = UIColor.white
            view.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        if !view.subviews.contains(decorationView){
            view.addSubview(decorationView)
        }
        if !view.subviews.contains(backgroundView){
            view.addSubview(backgroundView)
        }
        if !view.subviews.contains(notificationLabel){
            view.addSubview(notificationLabel)
        }
        
        view.center.x = parentView.center.x
        parentView.addSubview(view)
    }
    
    func hide(parent parentView: UIView, timeDelay delay: TimeInterval){
        UIView.animate(withDuration: 0.5, delay: delay, options: [.curveEaseIn, .allowUserInteraction], animations: {
            self.view.center.y += 170
            parentView.layoutIfNeeded()
        }, completion: {error in
            self.view.removeFromSuperview()
        }
        )
    }
      
}
