//
//  PopularKeywordUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/20.
//

import Foundation

struct PopularKeywordRequestValue {
}

protocol PopularKeywordUseCaseInterface {
    func execute(requestValue: PopularKeywordRequestValue) async throws
}

final class PopularKeywordUseCase: PopularKeywordUseCaseInterface {

    private let searchRepository: SearchRepositotyInterface

    init(searchRepository: SearchRepositotyInterface = SearchRepository()) {
        self.searchRepository = searchRepository
    }

    func execute(requestValue: PopularKeywordRequestValue) async throws {
        return try await searchRepository.getPopularKeyword()
    }
}
