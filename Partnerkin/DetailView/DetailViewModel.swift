//
//  DetailViewModel.swift
//  Partnerkin
//
//  Created by Владислав Соколов on 12.03.2025.
//

import Foundation

@MainActor
final class DetailViewModel: ObservableObject {
    @Published var conference: ConferenceDetails? = nil
    
    var formattedDate: String {
        conference?.startDate.formattedDateWithDuration(endDate: conference?.endDate ?? "") ?? ""
    }
    
    private let networkManager: ServerApi
    
    init(networkManager: ServerApi) {
        self.networkManager = networkManager
    }
    
    func fetchConferences() async {
        do {
            let response = try await networkManager.fetch(type: ConferenceDetailResponse.self, from: ConferenceEndpointView())
            self.conference = response.data
        } catch {
            print("Ошибка загрузки: \(error)")
        }
    }
}
