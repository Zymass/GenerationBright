//
//  ImageToImageViewModel.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 30.09.2023.
//

import SwiftUI
import Combine
import PhotosUI

enum ImageToImageViewEvents {

}

final class ImageToImageViewModel: ObservableObject {

    @Published var loadedImageBase64: String = ""
    @Published var selectedPhoto: PhotosPickerItem?{
        didSet{
            // MARK: If Photo is Selected, Then Processing The Image
            if let selectedPhoto{
                processPhoto(photo: selectedPhoto)
            }
        }
    }

    var positivePrompts: [Promt] = []
    var negativePrompts: [Promt] = []
    @Published var imageToImageUrl: String = ""

    let events = PassthroughSubject<ImageToImageViewEvents, Never>()
    let networkManager = NetworkManager()

    private var cancellables = Set<AnyCancellable>()

    init() {
        binding()
    }

    private func binding() {
        events
            .sink { [weak self] event in
                guard let self else { return }

//                switch event {
//                case .tapMainButton:
//                    textToImageRequest()
//                }
            }
            .store(in: &cancellables)
    }

    // MARK: Extracting Image Data
    
    private func processPhoto(photo: PhotosPickerItem){
        photo.loadTransferable(type: Data.self) { [weak self] result in
            guard let self else { return }

            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    guard let data else { return }

                    self.loadedImageBase64 = data.base64EncodedString()
                case .failure(let failure):
                    print("❌\(failure)")
                }
            }
        }
    }

    private func uploadImage(completion: @escaping (String) -> ()) {
        networkManager.uploadImage(dataBase64: loadedImageBase64) { response in
            guard let link = response?.link else { return }

            completion(link)
        }
    }

    private func fetchImage(id: String) {
        networkManager.fetchImage(id: id) { [weak self] response in
            guard let self, let response, let imageUrl = response.output.first else { return }

            imageToImageUrl = imageUrl
        }
    }

    private func requestImageToImage(link: String) {
        let positivePromptsString = positivePrompts.map { $0.value }.joined(separator: ", ")
        let negativePromptsString = negativePrompts.map { $0.value }.joined(separator: ", ")

        networkManager.requestImageToImage(
            image: link,
            prompt: positivePromptsString,
            negativPrompt: negativePromptsString,
            modelId: StableDiffusionModels.midjourney.rawValue,
            width: 512,
            height: 512
        ) { response in
            guard let response else { return }

            if response.output.isEmpty {
                self.fetchImage(id: String(response.id))
            } else {
                self.imageToImageUrl = response.output.first ?? ""
            }
        }
    }
}
