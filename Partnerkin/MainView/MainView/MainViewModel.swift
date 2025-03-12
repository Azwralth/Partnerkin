//
//  MainViewModel.swift
//  Partnerkin
//
//  Created by Владислав Соколов on 12.03.2025.
//

import Foundation

@MainActor
final class MainViewModel: ObservableObject {
    @Published var conferences: [ConferenceDetails] = []
    
    private let networkManager: ServerApi
    
    init(networkManager: ServerApi) {
        self.networkManager = networkManager
    }
    
    func fetchConferences() async {
        do {
            let response = try await networkManager.fetch(type: ConferenceResponse.self, from: ConferenceEndpointList())
            self.conferences = response.data.result.map { $0.conference }
        } catch {
            print("Ошибка загрузки: \(error)")
        }
    }
}
