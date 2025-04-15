//
//  MainView.swift
//  Partnerkin
//
//  Created by Владислав Соколов on 12.03.2025.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel(networkManager: NetworkManager())
        
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ScrollView {
                VStack {
                    ForEach(viewModel.conferences, id: \.id) { conference in
                        Button {
                            coordinator.next(.conferenceDetail(.conferenceDetail))
                        } label: {
                            MainViewCell(conference: conference)
                                .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .navigationDestination(for: Coordinator.Step.self) { destination in
                destination.view
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Конференции")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.fetchConferences()
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(Coordinator())
}
