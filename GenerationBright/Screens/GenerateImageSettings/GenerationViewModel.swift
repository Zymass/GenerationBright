//
//  GenerationViewModel.swift
//  GenerationBright
//
//  Created by Ilia Filiaev on 13.09.2023.
//

import SwiftUI
import Combine

protocol GenerationViewModelProtocol {
    var positivePromts: CurrentValueSubject<[PromtCollectionItem], Never> { get }
    var updateUI: PassthroughSubject<Void, Never> { get }

    func deleteItem(id: String)
}

final class GenerationViewModel: GenerationViewModelProtocol {
    var positivePromts = CurrentValueSubject<[PromtCollectionItem], Never>([])
    var updateUI = PassthroughSubject<Void, Never>()

    init() {
        var promts = [PromtCollectionItem]()
        for index in 0...10 {
            let promtItem = PromtCollectionItem(id: "\(index)") { [weak self] id in
                guard let self else { return }

                positivePromts.value.removeAll { value in
                    value.id == id
                }
                updateUI.send(())
            }
            promts.append(promtItem)
        }
        positivePromts.send(promts)
    }

    func deleteItem(id: String) {
        positivePromts.value.removeAll { item in
            item.id == id

        }
    }
}
