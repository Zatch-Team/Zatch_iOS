//
//  SearchResultUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/20.
//

import Foundation

struct SearchResultRequestValue {
}

protocol SearchResultUseCaseInterface {
    func execute(requestValue: SearchResultRequestValue) async throws
}

final class SearchResultUseCase: SearchResultUseCaseInterface {

    private let searchRepository: SearchRepositotyInterface

    init(searchRepository: SearchRepositotyInterface = SearchRepository()) {
        self.searchRepository = searchRepository
    }

    func execute(requestValue: SearchResultRequestValue) async throws {
        return try await searchRepository.getSearchResult()
    }
}
