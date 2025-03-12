//
//  EndPointProtocol.swift
//  Partnerkin
//
//  Created by Владислав Соколов on 12.03.2025.
//

import Foundation

protocol EndpointProtocol {
    var url: URL { get }
    var method: HTTPMethod { get }
}

extension EndpointProtocol {
    var method: HTTPMethod {
        .get
    }
    
    func urlRequest() throws -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
