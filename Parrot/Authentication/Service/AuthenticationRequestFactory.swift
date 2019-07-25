//
//  AuthenticationRequestFactory.swift
//  Parrot
//
//  Created by administrador on 25/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import Alamofire

class AutenticacaoRequestFactory {
    
    static func postSignUp(name: String, username: String, email: String, password: String) -> DataRequest {
        
        let formSignUp = [
            "nome": name,
            "username": username,
            "email": email,
            "password": password
        ]
        
        return Alamofire.request("\(BASE_URL)/usuario", method: .post, parameters: formSignUp, encoding: JSONEncoding.default)
    }
    
    static func postLogin(email: String, password: String) -> DataRequest {
        
        let formLogin = [
            "email": email,
            "password": password
        ]
        
        return Alamofire.request("\(BASE_URL)/usuario/login", method: .post, parameters: formLogin, encoding: JSONEncoding.default)
    }
}
