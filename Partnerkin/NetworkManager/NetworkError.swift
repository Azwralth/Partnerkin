//
//  NetworkError.swift
//  Partnerkin
//
//  Created by Владислав Соколов on 12.03.2025.
//

import Foundation

enum NetworkError: Error, Equatable {
    case invalidUrl
    case invalidResponse
    case decodingFailed
}
