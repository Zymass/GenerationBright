//
//  TextToImageRequest.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 19.09.2023.
//

import Foundation

struct TextToImageRequest: Codable {
    var key: String
    var modelId: String
    var prompt: String
    var negativePrompt: String
    var width: Int
    var height: Int
    var samples: Int
    var numInferenceSteps: Int
    // yes/no
    var safetyChecker: String
    // yes/no
    var enhancePrompt: String
    var seed: String?
    var guidanceScale: Double
    // yes/no
    var multiLingual: String
    // yes/no
    var panorama: String
    // yes/no
    var selfAttention: String
    // yes/no
    var upscale: String
    var embeddingsModel: String?
    var webhook: String?
    var trackId: String?
    var loraModel: String
    // yes/no
    var tomesd: String
    var clipSkip: Int
    // yes/no
    var useKarrasSigmas: String
    var vae: String?
    var loraStrength: String?
    var scheduler: String

    enum CodingKeys: String, CodingKey {
        case key
        case modelId = "model_id"
        case prompt
        case negativePrompt = "negative_prompt"
        case width
        case height
        case samples
        case numInferenceSteps = "num_inference_steps"
        case safetyChecker = "safety_checker"
        case enhancePrompt = "enhance_prompt"
        case seed
        case guidanceScale
        case multiLingual = "multi_lingual"
        case panorama
        case selfAttention = "self_attention"
        case upscale
        case embeddingsModel = "embeddings_model"
        case webhook
        case trackId = "track_id"
        case loraModel = "lora_model"
        case tomesd
        case clipSkip = "clip_skip"
        case useKarrasSigmas = "use_karras_sigmas"
        case vae
        case loraStrength = "lora_strength"
        case scheduler
    }
}
