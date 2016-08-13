//
//  CellStates.swift
//  TableViewSignupLogin
//
//  Created by Diwakar Kamboj on 08/08/16.
//  Copyright © 2016 Diwakar Kamboj. All rights reserved.
//

import Foundation

enum CellType {
    case EmailTextField
    case PasswordTextField
    case NameTextField
    case LoginButton
    case SignupButton
}

let loginState: [CellType] = [
    .EmailTextField,
    .PasswordTextField,
    .LoginButton
]

let signupState: [CellType] = [
    .EmailTextField,
    .NameTextField,
    .PasswordTextField,
    .SignupButton
]
