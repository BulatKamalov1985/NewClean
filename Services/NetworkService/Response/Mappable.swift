//
//  Mappable.swift
//  NewClean
//
//  Created by Bulat Kamalov on 01.04.2022.
//

import Foundation

protocol mappable {
    
    func decode<T> (_ type: T.Type, from data: Data ) throws -> T where T: Decodable
    
}

extension mappable {
    
    func decode <T> (_ type: T.Type, from data: Data) throws -> T where T: Decodable {
        return try JSONDecoder().decode(T.self, from: data)
    }
}
