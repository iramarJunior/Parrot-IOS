//
//  ViewController.swift
//  Treinamento-iOS
//
//  Created by Jobson Mateus on 12/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var fieldEmail: UITextField!
    @IBOutlet weak var fieldPassword: UITextField!
    
    var service: AuthenticationService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.service = AuthenticationService(delegate: self)
    }
    
    @IBAction func buttonLogin(_ sender: Any) {
        
        if let email = self.fieldEmail.text,
            let password = self.fieldPassword.text,
            !email.isEmpty && !password.isEmpty {
            self.service.postLogin(email: email, password: password)
        }
    }
    
    @IBAction func buttonSignUp(_ sender: Any) {
        
//        let controller = StoryboardScene.Main.cadastroViewController.instantiate()
//        self.present(controller, animated: true)
    }
}

extension LoginViewController: AuthenticationServiceDelegate {
    
    func success() {
        ScreenManager.setupInitialViewController()
    }
    
    func failure(error: String) {
        print(error)
    }
}
