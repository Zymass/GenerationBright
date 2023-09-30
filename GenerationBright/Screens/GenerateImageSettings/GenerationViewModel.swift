//
//  GenerationViewModel.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 13.09.2023.
//

import SwiftUI
import Combine

enum TextToImageViewEvents {
    case tapMainButton
}

enum StableDiffusionModels: String {
    case midjourney
    case sdxl
    case anythingV4 = "anything-v4"
    case gta = "gta5-artwork-diffusi"
    case wifuDiffusion = "wifu-diffusion"
    case relax = "synthwave-diffusion"
    case realistic = "realistic-vision-v40"
}

final class GenerationViewModel: ObservableObject {
    var positivePromts: [Promt] = []
    var negativePromts: [Promt] = []
    @Published var textToImageUrl: String = ""

    let events = PassthroughSubject<TextToImageViewEvents, Never>()
    let networkManager = NetworkManager()

    private var cancellables = Set<AnyCancellable>()

    init() {
        binding()
    }

    private func binding() {
        events
            .sink { [weak self] event in
                guard let self else { return }

                switch event {
                case .tapMainButton:
                    textToImageRequest()
                }
            }
            .store(in: &cancellables)
    }

    private func textToImageRequest() {
        let positivePrompts = positivePromts.map { $0.value }.joined(separator: ", ")
        let negativePrompts = negativePromts.map { $0.value }.joined(separator: ", ")

        networkManager.requestTextToImage(
            prompt: positivePrompts,
            negativPrompt: negativePrompts,
            modelId: StableDiffusionModels.midjourney.rawValue,
            width: 512,
            height: 512
        ) { [weak self] response in
            guard let self, let response else { return }

            if response.output.isEmpty {
                fetchImage(id: String(response.id))
            } else {
                textToImageUrl = response.output.first ?? ""
            }
        }
    }

    private func fetchImage(id: String) {
        networkManager.fetchImage(id: id) { [weak self] response in
            guard let self, let response, let imageUrl = response.output.first else { return }

            textToImageUrl = imageUrl
        }
    }
}
