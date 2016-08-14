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
    
    var currentState = loginState
    var nextState = signupState

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
        return (currentState == loginState) ? loginState.count : signupState.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return (currentState == loginState) ? getReusableCell(forType: loginState[indexPath.row]) : getReusableCell(forType: signupState[indexPath.row])
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
        let diff = currentState.diff(nextState)
        
        swap(&currentState, &nextState)
        
        authTableView.beginUpdates()
        authTableView.insertRowsAtIndexPaths(generateIndexPaths(fromIndexes: diff.addedIndexes) , withRowAnimation: .Fade)
        authTableView.deleteRowsAtIndexPaths(generateIndexPaths(fromIndexes: diff.removedIndexes), withRowAnimation: .Fade)
        authTableView.endUpdates()
    }
    
    func generateIndexPaths(fromIndexes indexes: [Int]) -> [NSIndexPath] {
        var indexPaths = [NSIndexPath]()
        
        for index in indexes {
            indexPaths.append(NSIndexPath(forRow: index, inSection: 0))
        }
        
        return indexPaths
    }

}

