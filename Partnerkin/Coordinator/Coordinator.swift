//
//  Coordinator.swift
//  Partnerkin
//
//  Created by Владислав Соколов on 21.03.2025.
//

import SwiftUI

final class Coordinator: ObservableObject {
    enum Step: Hashable {
        case conferenceDetail(_ value: DetailCoordinator)
        case dateDetail(_ value: DetailCoordinator)
        
        var view: some View {
            Group {
                switch self {
                case .conferenceDetail(let value):
                    value.view
                case .dateDetail(let value):
                    value.view
                }
            }
        }
    }
    
    @Published var path: [Step] = []
    
    
    func next(_ step: Step) {
        Task {
            await MainActor.run {
                withAnimation {
                    path += [step]
                }
            }
        }
    }
    
    func root() {
        Task {
            await MainActor.run {
                withAnimation {
                    self.path = []
                }
            }
        }
    }
}
