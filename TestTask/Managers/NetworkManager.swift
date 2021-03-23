//
//  NetworkManager.swift
//  TestTask
//
//  Created by Yaroslav Himko on 24.03.21.
//

import RxSwift
import Moya

struct NetworkManager {
    
    private static let shrared = NetworkManager()
    
    private let provider = MoyaProvider<GoogleService>()

    init() {}
    
    func executeRequest() -> Completable {
        return provider.rx
            .request(.getGoogle)
            .filterSuccessfulStatusAndRedirectCodes()
            .asObservable().ignoreElements()
        
    }
}
