//
//  AuthenticationService.swift
//  Parrot
//
//  Created by administrador on 26/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol AuthenticationServiceDelegate {
    
    func success()
    func failure(error: String)
}

class AuthenticationService {
    
    var delegate: AuthenticationServiceDelegate!
    
    init(delegate: AuthenticationServiceDelegate) {
        self.delegate = delegate
    }
    
//    func postSignUp(name: String, username: String, email: String, password: String) {
//
//        AuthenticationService.postSignUp(name: name, username: username, email: email, password: password).validate().responseObject(keyPath: "data", completionHandler: { (response: DataResponse<User>) in
//
//            switch response.result {
//
//            case .success:
//
//                if let user = response.result.value {
//
//                    if let client = response.response?.allHeaderFields["Client"] as? String,
//                        let token = response.response?.allHeaderFields["Access-Token"] as? String,
//                        let uid = response.response?.allHeaderFields["Uid"] as? String {
//
//                        usuario.token = token
//                        usuario.client = client
//                        usuario.uid = uid
//
//                        UsuarioViewModel.save(object: usuario)
//
//                        SessionControl.setHeaders()
//                    }
//                }
//
//                self.delegate.success()
//
//            case .failure(let error):
//
//                self.delegate.failure(error: error.localizedDescription)
//            }
//        })
//    }
    
    func postLogin(email: String, password: String) {
        AutenticacaoRequestFactory.postLogin(email: email, password: password).validate().responseObject(keyPath: "data", completionHandler: { (response: DataResponse<User>) in
            
            switch response.result {
                
            case .success:
                
                if let user = response.result.value {
                    
                    if let token = response.response?.allHeaderFields["token"] as? String {
                        
                        user.token = token
                        
                        UserViewModel.save(object: user)
                    }
                }
                
                self.delegate.success()
            case .failure(let error):
                
                self.delegate.failure(error: error.localizedDescription)
            }
        })
    }
}
