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
            let userId: Int
            let id: Int
            let title: String
            let body: String
        }
        struct ViewModel: Codable {
            let userId: Int
            let id: Int
            let title: String
            let body: String
            let bool: Bool?
            init(
                response: ResponseModel,
                index: Int
            ) {
                self.userId = response.userId
                self.id = response.id
                self.title = response.title
                self.body = response.body
                if index % 2 == 0 {
                    self.bool = true
                } else {
                    self.bool = false
                    }
                }
            }
        }
    }


extension ViewModel {
    var cellColor: UIColor? {
        if bool ?? false {
            return .green
        } else {
            return .black
        }
    }
}



