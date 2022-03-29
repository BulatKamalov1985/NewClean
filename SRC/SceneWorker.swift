//
//  SceneWorker.swift
//  NewClean
//
//  Created by Bulat Kamalov on 28.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

final class SceneWorker: SceneWorkerLogic {
    func get(_ request: RequestModel) -> ResponseModel {
        let person = Person(firstName: "Mike")
        return ResponseModel(person: Array(repeating: person, count: 30))
    }
}
