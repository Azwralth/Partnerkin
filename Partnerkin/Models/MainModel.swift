//
//  MainModel.swift
//  Partnerkin
//
//  Created by Владислав Соколов on 12.03.2025.
//

import Foundation

struct ConferenceResponse: Codable {
    let data: ConferenceData
}

struct ConferenceDetailResponse: Codable {
    let data: ConferenceDetails
}

struct ConferenceData: Codable {
    let result: [ConferenceItem]
}

struct ConferenceItem: Codable {
    let conference: ConferenceDetails
}

struct ConferenceDetails: Codable {
    let id: Int
    let name: String
    let format: String
    let status: String
    let url: String
    let image: ConferenceImage
    let startDate: String
    let endDate: String
    let oneday: Int
    let customDate: String?
    let country: String
    let city: String
    let about: String?
    let categories: [ConferenceCategory]
    let type: ConferenceType
    
    enum CodingKeys: String, CodingKey {
        case id, name, format, status, url, image, oneday, country, city, categories, about, type
        case startDate = "start_date"
        case endDate = "end_date"
        case customDate = "custom_date"
    }
}

struct ConferenceType: Codable {
    let name: String
}

struct ConferenceImage: Codable {
    let id: String
    let url: String
}

struct ConferenceCategory: Codable {
    let id: Int
    let name: String
    let url: String
}

