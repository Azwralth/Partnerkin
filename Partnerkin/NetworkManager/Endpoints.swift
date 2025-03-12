//
//  Endpoints.swift
//  Partnerkin
//
//  Created by Владислав Соколов on 12.03.2025.
//

import Foundation

struct ConferenceEndpointList: EndpointProtocol {
    var url: URL {
        return URL(string: "https://partnerkin.com/api_ios_test/list?api_key=DMwdj29q@S29shslok2")!
    }
}

struct ConferenceEndpointView: EndpointProtocol {
    var url: URL {
        return URL(string: "https://partnerkin.com/api_ios_test/view?api_key=DMwdj29q@S29shslok2")!
    }
}
