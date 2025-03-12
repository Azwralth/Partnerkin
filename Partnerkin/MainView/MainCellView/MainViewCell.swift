//
//  MainViewCell.swift
//  Partnerkin
//
//  Created by Владислав Соколов on 12.03.2025.
//

import SwiftUI

struct MainViewCell: View {
    @StateObject var viewModel: MainCellViewModel
    @StateObject var imageViewModel = ImageLoaderViewModel()

    init(conference: ConferenceDetails) {
        _viewModel = StateObject(wrappedValue: MainCellViewModel(conference: conference))
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            canceledStatus
            conferenceTitle
            conferenceImageAndDate
            conferenceCategories
            conferenceLocation
        }
        .onAppear {
            Task {
                await imageViewModel.loadImage(from: viewModel.conference.image.url)
            }
        }
        .padding()
        .background(viewModel.backgroundColor)
        .cornerRadius(15)
    }
}

// MARK: - Components

private extension MainViewCell {
    
    var canceledStatus: some View {
        Group {
            if viewModel.isCanceled {
                HStack(spacing: 2) {
                    Image("bolt")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.red)
                    
                    Text("Отменено")
                        .customFont(type: .interSemibold, size: 14)
                        .foregroundColor(.red)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.red, lineWidth: 2)
                )
                .cornerRadius(20)
                .padding(.top, 10)
            }
        }
    }
    
    var conferenceTitle: some View {
        Text(viewModel.conference.name)
            .customFont(type: .interBold, size: 24)
            .fontWeight(.bold)
            .padding(.top, viewModel.isCanceled ? 16 : 24)
    }
    
    var conferenceImageAndDate: some View {
        GeometryReader { geometry in
            HStack(alignment: .center) {
                if let image = imageViewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width * 0.5, height: 110)
                        .clipShape(.rect(topLeadingRadius: 10, bottomLeadingRadius: 10))
                } else {
                    ProgressView()
                        .frame(width: geometry.size.width * 0.5, height: 110)
                }

                Text(viewModel.formattedDate)
                    .customFont(type: .interRegular, size: 20)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .frame(height: 110)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue.opacity(0.08)))
        .padding(.top, 20)
    }
    
    var conferenceCategories: some View {
        HStack {
            ForEach(viewModel.conference.categories, id: \.id) { item in
                TagView(text: item.name, color: .white)
            }
        }
        .padding(.top, 24)
        .padding(.bottom, 16)
    }
    
    var conferenceLocation: some View {
        HStack {
            Image("location")
            Text("\(viewModel.conference.country), \(viewModel.conference.city)")
                .customFont(type: .interRegular, size: 14)
        }
        .padding(.bottom, 24)
    }
}

