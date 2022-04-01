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
            var urlString: String
        }
        struct Response: Codable {
            let userId: Int?
            let id: Int?
            let title: String?
            let body: String?
        }
        struct ViewModel: Codable {
            let title: String?
            let body: String?
            init(resp: ResponseModel) {
                self.title = resp.title
                self.body = resp.body
            }
        }
    }
}

