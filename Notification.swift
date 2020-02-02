//
//  Notification.swift
//  Circle
//
//  Created by Student on 3/27/19.
//  Copyright © 2019 Imoehl Innovations. All rights reserved.
//

import UIKit

enum NotificationType: Int{
    case Error
    case Success
    case Warning
}

class Notification {
    var view: UIView = {
        let v = UIView(frame: CGRect(x: 20, y: UIScreen.main.bounds.size.height + 60, width: UIScreen.main.bounds.size.width - 40, height: 50))
        v.backgroundColor = UIColor.white
        v.layer.cornerRadius = 5
        v.layer.borderColor = UIColor.lightGray.cgColor
        //print(UIScreen.main.bounds.size.height)
        return v
    }()
    
    var notificationLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: UIScreen.main.bounds.size.width - 40, height: 50))
        label.text = ""
        
        label.numberOfLines = 0
        return label
    }()
    
    var decorationView: UIView = {
        let dv = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        dv.backgroundColor = UIColor.red
        dv.layer.cornerRadius = 5
        return dv
    }()
    
    func show(parent parentView: UIView, _ type: NotificationType, _ message: String){
        notificationLabel.text = message
        
        switch type{
        case .Error:
            decorationView.backgroundColor = UIColor.red
        case .Success:
            decorationView.backgroundColor = UIColor.green
        case .Warning:
            decorationView.backgroundColor = UIColor.yellow
        }
        if !view.subviews.contains(decorationView){
            view.addSubview(decorationView)
        }
        if !view.subviews.contains(notificationLabel){
            view.addSubview(notificationLabel)
        }
        
        
        view.center.x = parentView.center.x
        parentView.addSubview(view)
        //parentView.bringSubviewToFront(view)
        UIView.animate(withDuration: 1.0, delay: 3.0, options: .curveEaseIn, animations: {
            self.view.center.y -= 170
            parentView.layoutIfNeeded()
        }, completion: { error in
            self.hide(parent: parentView, timeDelay: 5.0)
            
        })
        
    }
    
    func show(parent parentView: UIView,_ delay: Float, _ type: NotificationType, _ message: String){
        notificationLabel.text = message
        
        switch type{
        case .Error:
            decorationView.backgroundColor = UIColor.red
        case .Success:
            decorationView.backgroundColor = UIColor.green
        case .Warning:
            decorationView.backgroundColor = UIColor.yellow
        }
        if !view.subviews.contains(decorationView){
            view.addSubview(decorationView)
        }
        if !view.subviews.contains(notificationLabel){
            view.addSubview(notificationLabel)
        }
        
        
        view.center.x = parentView.center.x
        parentView.addSubview(view)
        //parentView.bringSubviewToFront(view)
        UIView.animate(withDuration: 1.0, delay: TimeInterval(delay), options: .curveEaseIn, animations: {
            self.view.center.y -= 170
            parentView.layoutIfNeeded()
        }, completion: { error in
            self.hide(parent: parentView, timeDelay: 5.0)
            
        })
        
    }
    
    func hide(parent parentView: UIView, timeDelay delay: TimeInterval){
        UIView.animate(withDuration: 1.0, delay: delay, options: .curveEaseIn, animations: {
            self.view.center.y += 170
            parentView.layoutIfNeeded()
        }, completion: nil)
    }
    
}
