//
//  DetailView.swift
//  Partnerkin
//
//  Created by Владислав Соколов on 12.03.2025.
//

import SwiftUI

struct DetailView: View {
    @StateObject var viewModel = DetailViewModel(networkManager: NetworkManager())
    @StateObject var imageViewModel = ImageLoaderViewModel()
    @Environment(\.presentationMode) var presentationMode
        
    @EnvironmentObject private var coordinator: Coordinator
    
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    conferenceHeader
                    conferenceImage
                    conferenceCategories
                    conferenceDateAndLocation
                    registrationButton
                    conferenceAbout
                    
                    Spacer()
                }
                .padding()
            }
            .navigationDestination(for: Coordinator.Step.self) { destination in
                destination.view
            }
            .task {
                await viewModel.fetchConferences()
                await imageViewModel.loadImage(from: viewModel.conference?.image.url ?? "")
            }
            .scrollIndicators(.hidden)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    backButton
                }
            }
    }
}

// MARK: - Компоненты

private extension DetailView {
    
    var conferenceHeader: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(viewModel.conference?.type.name ?? "")
                .customFont(type: .interRegular, size: 14)
            Text(viewModel.conference?.name ?? "")
                .customFont(type: .interBold, size: 24)
        }
        .padding(.bottom, 20)
    }

    var conferenceImage: some View {
        Group {
            if let image = imageViewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                ProgressView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
    }

    var conferenceCategories: some View {
        HStack {
            ForEach(viewModel.conference?.categories ?? [], id: \.id) { item in
                TagView(text: item.name, color: .tag)
            }
        }
        .padding(.top, 24)
        .padding(.bottom, 16)
    }

    var conferenceDateAndLocation: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image("blueSchedule")
                Text(viewModel.formattedDate)
                    .customFont(type: .interRegular, size: 14)
            }
            
            HStack {
                Image("blueLocation")
                Text("\(viewModel.conference?.country ?? ""), \(viewModel.conference?.city ?? "")")
                    .customFont(type: .interRegular, size: 14)
            }
        }
        .padding(.bottom, 10)
    }

    var registrationButton: some View {
        Button {
            coordinator.next(.dateDetail(.dateDetail))
        } label: {
            Text("Регистрация")
                .customFont(type: .interSemibold, size: 16)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(.registerButton)
                .cornerRadius(12)
        }
        .padding(.top, 28)
    }

    var conferenceAbout: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("О событии")
                .customFont(type: .interSemibold, size: 18)
                .padding(.top, 80)
            
            Text(viewModel.conference?.about ?? "")
        }
    }

    var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image("vector")
        }
    }
}

#Preview {
    DetailView()
        .environmentObject(Coordinator())
}
