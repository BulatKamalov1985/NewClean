//
//  SceneModels.swift
//  NewClean
//
//  Created by Bulat Kamalov on 28.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

typealias ViewModel = Scene.InitForm.ViewModel
typealias RequestModel = Scene.InitForm.Request
typealias ResponseModel = Scene.InitForm.Response

enum Scene {
    enum InitForm {
        struct Request {
    
        }
        struct Response: Codable {
            let userId: Int?
            let id: Int?
            let title: String?
            let body: String?
        }
        struct ViewModel: Codable {
            let id: Int?
            let title: String?
            let body: String?
            init(response: ResponseModel) {
                self.id = response.id ?? 1
                self.title = response.title
                self.body = response.body
            }
        }
    }
}


