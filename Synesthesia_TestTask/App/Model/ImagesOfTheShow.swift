//
//  ImagesOfTheShow.swift
//  Synesthesia_TestTask
//
//  Created by Alexander Grigoryev on 3.11.2022.
//

import Foundation

// MARK: - ImagesCollectionElement
struct ImagesCollectionElement: Codable, Hashable, Equatable {
    let id: Int
    let type: TypeEnum
    let main: Bool
    let resolutions: Resolutions
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: ImagesCollectionElement, rhs: ImagesCollectionElement) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - Resolutions
struct Resolutions: Codable {
    let original: Medium
    let medium: Medium?
}

// MARK: - Medium
struct Medium: Codable {
    let url: String
    let width, height: Int
}

enum TypeEnum: String, Codable {
    case background = "background"
    case banner = "banner"
    case poster = "poster"
}

typealias ImagesCollectionModel = [ImagesCollectionElement]
