//
//  ViewController.swift
//  In-App-Notification
//
//  Created by DJ Imoehl on 2/1/20.
//  Copyright © 2020 DJ Imoehl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func onSuccessClick(_ sender: Any) {
        let notification = Notification()
        notification.show(parent: self.view, ofType: .Success, ofTheme: .Dark, withMessage: "This is a success message")
        print("Success message shown")
    }
    
    @IBAction func onErrorClick(_ sender: Any) {
        let notification = Notification()
        notification.show(parent: self.view, ofType: .Error, ofTheme: .Light, withMessage: "This is an error message")
    }
    
    @IBAction func onWarningClick(_ sender: Any) {
        let notification = Notification()
        notification.show(parent: self.view, ofType: .Warning, ofTheme: .Normal, withMessage: "This is a warning message")
    }
    
    @IBAction func onInformationClick(_ sender: Any) {
        let notification = Notification()
        notification.show(parent: self.view, ofType: .Information, ofTheme: .Dark, withMessage: "This is an informational message")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

