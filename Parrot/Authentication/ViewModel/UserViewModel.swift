//
//  UserViewModel.swift
//  Parrot
//
//  Created by administrador on 26/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import RealmSwift

struct UserView {
    
    var email = ""
}

class UserViewModel {
    
    static func save(object: User) {
        
        try? uiRealm.write {
            uiRealm.add(object, update: .all)
        }
    }
    
    static func delete() {
        
        if let result = uiRealm.objects(User.self).first {
            try? uiRealm.write {
                uiRealm.delete(result)
            }
        }
    }
}
