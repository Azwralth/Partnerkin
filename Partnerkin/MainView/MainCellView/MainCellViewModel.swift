//
//  MainCellViewModel.swift
//  Partnerkin
//
//  Created by Владислав Соколов on 12.03.2025.
//

import UIKit
import SwiftUI

@MainActor
final class MainCellViewModel: ObservableObject {
    let conference: ConferenceDetails

    var isCanceled: Bool {
        conference.status == "canceled"
    }

    var backgroundColor: Color {
        isCanceled ? Color.red.opacity(0.08) : Color.tag
    }

    var formattedDate: String {
        conference.startDate.formattedDate()
    }

    init(conference: ConferenceDetails) {
        self.conference = conference
    }
}

