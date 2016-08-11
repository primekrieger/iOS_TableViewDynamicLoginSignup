//
//  ViewController.swift
//  TableViewSignupLogin
//
//  Created by Diwakar Kamboj on 08/08/16.
//  Copyright © 2016 Diwakar Kamboj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var authTableView: UITableView!
    
    var isStateLogin = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        authTableView.registerNib(UINib(nibName: "EmailTableViewCell", bundle: nil), forCellReuseIdentifier: "emailCell")
        authTableView.registerNib(UINib(nibName: "PasswordTableViewCell", bundle: nil), forCellReuseIdentifier: "passwordCell")
        authTableView.registerNib(UINib(nibName: "NameTableViewCell", bundle: nil), forCellReuseIdentifier: "nameCell")
        authTableView.registerNib(UINib(nibName: "LoginButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "loginCell")
        authTableView.registerNib(UINib(nibName: "SignupButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "signupCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isStateLogin {
            return loginState.count
        } else {
            return signupState.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if isStateLogin {
            return getReusableCell(forType: loginState[indexPath.row])
        } else {
            return getReusableCell(forType: signupState[indexPath.row])
        }
    }
    
    func getReusableCell(forType type: CellType) -> UITableViewCell {
        switch type {
        case .EmailTextField:
            return authTableView.dequeueReusableCellWithIdentifier("emailCell") as! EmailTableViewCell
        case .PasswordTextField:
            return authTableView.dequeueReusableCellWithIdentifier("passwordCell") as! PasswordTableViewCell
        case .NameTextField:
            return authTableView.dequeueReusableCellWithIdentifier("nameCell") as! NameTableViewCell
        case .LoginButton:
            return authTableView.dequeueReusableCellWithIdentifier("loginCell") as! LoginButtonTableViewCell
        case .SignupButton:
            return authTableView.dequeueReusableCellWithIdentifier("signupCell") as! SignupButtonTableViewCell
        }
    }

    @IBAction func switchStateTap(sender: UIButton) {
        let indexPathA1 = [NSIndexPath(forRow: 1, inSection: 0), NSIndexPath(forRow: 3, inSection: 0)]
        let indexPathA2 = [NSIndexPath(forRow: 2, inSection: 0)]
        
        authTableView.beginUpdates()
        if isStateLogin {
            authTableView.insertRowsAtIndexPaths(indexPathA1, withRowAnimation: .Fade)
            authTableView.deleteRowsAtIndexPaths(indexPathA2, withRowAnimation: .Fade)
        } else {
            authTableView.insertRowsAtIndexPaths(indexPathA2, withRowAnimation: .Fade)
            authTableView.deleteRowsAtIndexPaths(indexPathA1, withRowAnimation: .Fade)
        }
        isStateLogin = !isStateLogin
        authTableView.endUpdates()
    }

}

