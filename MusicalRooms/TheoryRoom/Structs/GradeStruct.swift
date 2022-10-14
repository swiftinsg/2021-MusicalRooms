//
//  GradeStruct.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 15/11/21.
//

import Foundation

struct Grades: Codable, RawRepresentable {
    var grades: [Grade]
    
    public init(grades: [Grade]) {
        self.grades = grades
    }
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Grade].self, from: data)
        else {
            return nil
        }
        grades = result
    }
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(grades),
            let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

struct Grade: Identifiable, Equatable, Encodable, Decodable{
    var id = UUID()
    
    var number: Int
    var percentageCorrect: Double
}


