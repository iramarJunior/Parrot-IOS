//
//  ScreenManager.swift
//  Parrot
//
//  Created by administrador on 26/07/19.
//  Copyright © 2019 Treinamento. All rights reserved.
//

import Foundation
import UIKit

class ScreenManager {
    
    static func setupInitialViewController() {
        
        if SessionControl.isSessionActive {
            
//            UIApplication.shared.keyWindow?.rootViewController = UINavigationController(rootViewController: StoryboardScene.Contatos.contatosViewController.instantiate())
        } else {
            UIApplication.shared.keyWindow?.rootViewController = StoryboardScene.Authentication.initialScene.instantiate()
        }
    }
}
