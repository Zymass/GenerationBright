//
//  NetworkManager.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 17.09.2023.
//

import Foundation
import Alamofire

final class NetworkManager {
    let decoder = JSONDecoder()
    let accessKey = "Xg1DySGHAkq5GcftYzv3kCwJigG3VfNHGuwBMcBM9flzu77smKXYdp4r728V"

    func requestTextToImage(
        prompt: String,
        negativPrompt: String,
        modelId: String,
        width: Int,
        height: Int,
        completion: @escaping (TextToImageResponse?) -> ()
    ) {
        let url = "https://stablediffusionapi.com/api/v4/dreambooth"

        let param = TextToImageRequest(
            key: accessKey,
            modelId: modelId,
            prompt: prompt,
            negativePrompt: negativPrompt,
            width: width,
            height: height,
            samples: 1,
            numInferenceSteps: 30,
            safetyChecker: "no",
            enhancePrompt: "yes",
            seed: "",
            guidanceScale: 7.5,
            multiLingual: "no",
            panorama: "no",
            selfAttention: "no",
            upscale: "no",
            embeddingsModel: "",
            webhook: "",
            trackId: "",
            loraModel: "",
            tomesd: "yes",
            clipSkip: 2,
            useKarrasSigmas: "yes",
            vae: "",
            loraStrength: "",
            scheduler: "UniPCMultistepScheduler"
        )

        AF.request(url,
                   method: .post,
                   parameters: param,
                   encoder: JSONParameterEncoder.default
        ).response { [weak self] response in

            guard let self else { return }

            switch response.result {
            case .success(let data):
                guard let data else { return }

                do {
                    let response = try self.decoder.decode(
                        TextToImageResponse.self,
                        from: data
                    )
                    completion(response)
                } catch {
                    completion(nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }

    func requestImageToImage(
        image: String,
        prompt: String,
        negativPrompt: String,
        modelId: String,
        width: Int,
        height: Int,
        completion: @escaping (TextToImageResponse?) -> ()
    ) {
        let url = "https://stablediffusionapi.com/api/v4/dreambooth"

        let param = ImageToImageRequest(
            key: accessKey,
            modelId: modelId,
            prompt: prompt,
            negativePrompt: negativPrompt,
            initImage: image,
            width: width,
            height: height,
            samples: 1,
            numInferenceSteps: 30,
            safetyChecker: "no",
            enhancePrompt: "yes",
            guidanceScale: 7.5,
            multiLingual: "no",
            panorama: "no",
            selfAttention: "no",
            upscale: "no",
            loraModel: "",
            tomesd: "yes",
            clipSkip: 2,
            useKarrasSigmas: "yes",
            scheduler: "UniPCMultistepScheduler",
            strength: 0.7
        )

        AF.request(url,
                   method: .post,
                   parameters: param,
                   encoder: JSONParameterEncoder.default
        ).response { [weak self] response in

            guard let self else { return }

            switch response.result {
            case .success(let data):
                guard let data else { return }

                do {
                    let response = try self.decoder.decode(
                        TextToImageResponse.self,
                        from: data
                    )
                    completion(response)
                } catch {
                    completion(nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }

    func uploadImage(dataBase64: String, completion: @escaping (UploadImageResponse?) -> ()) {
        let url = "https://stablediffusionapi.com/api/v3/base64_crop"

        let param = UploadImageRequest(key: accessKey, image: dataBase64, crop: "true")

        AF.request(url,
                   method: .post,
                   parameters: param,
                   encoder: URLEncodedFormParameterEncoder.default
        ).response { [weak self] response in

            guard let self else { return }

            switch response.result {
            case .success(let data):
                guard let data else { return }

                do {
                    let response = try self.decoder.decode(
                        UploadImageResponse.self,
                        from: data
                    )
                    completion(response)
                } catch {
                    completion(nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }

    func fetchImage(id: String, completion: @escaping (FetchImageResponse?) -> ()) {
        let url = "https://stablediffusionapi.com/api/v4/dreambooth"

        let param = FetchImageRequest(key: accessKey, requestId: id)

        AF.request(url,
                   method: .post,
                   parameters: param,
                   encoder: URLEncodedFormParameterEncoder.default
        ).response { [weak self] response in

            guard let self else { return }

            switch response.result {
            case .success(let data):
                guard let data else { return }

                do {
                    let response = try self.decoder.decode(
                        FetchImageResponse.self,
                        from: data
                    )
                    completion(response)
                } catch {
                    completion(nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
}

