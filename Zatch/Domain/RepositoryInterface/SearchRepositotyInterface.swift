//
//  SearchRepositotyInterface.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/20.
//

import Foundation
import RxSwift

protocol SearchRepositotyInterface{
    func getPopularKeywords() -> Observable<[PopularKeywords]?>
    func getSearchResult()
}
