//
//  DetailCoordinator.swift
//  Partnerkin
//
//  Created by Владислав Соколов on 21.03.2025.
//

import SwiftUI

enum DetailCoordinator: String {
    case conferenceDetail = "Конференция"
    case dateDetail = "Дата"
    
    var view: some View {
        Group {
            switch self {
            case .conferenceDetail:
                DetailView()
            case .dateDetail:
                EmptyView()
            }
        }
    }
}
