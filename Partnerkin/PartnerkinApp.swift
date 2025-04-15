//
//  PartnerkinApp.swift
//  Partnerkin
//
//  Created by Владислав Соколов on 12.03.2025.
//

import SwiftUI

@main
struct PartnerkinApp: App {
    @StateObject var coordinator = Coordinator()
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
