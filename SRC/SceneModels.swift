//
//  SceneModels.swift
//  NewClean
//
//  Created by Bulat Kamalov on 28.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

typealias ViewModel = Scene.InitForm.ViewModel
typealias RequestModel = Scene.InitForm.Request
typealias ResponseModel = Scene.InitForm.Response

enum Scene {
    enum InitForm {
        struct Request {
            
        }
        struct Response {
            let person: [Person]
        }
        struct ViewModel {
            var person: [Person]
        }
    }
}

struct Person {
    let id = UUID().uuidString
    let firstName: String
}
