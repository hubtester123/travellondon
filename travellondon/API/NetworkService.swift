//
//  NetworkService.swift
//  travellondon
//
//  Created by Tony Cheung on 22/11/2022.
//

import Foundation
import Combine

enum NetworkError:Error {
    case decodeURLError
    case apiError(Int)
    case parseError
    case unknown
}

struct NetworkService {
    
    static func request<T:ParseProtocol>(request:URLRequest) -> AnyPublisher<T, NetworkError> {
        
        return URLSession.shared
                .dataTaskPublisher(for: request)
                .tryMap { data, response  in
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.unknown
                }

                if httpResponse.statusCode < 200 ||
                   httpResponse.statusCode >= 300 {
                    throw NetworkError.apiError(httpResponse.statusCode)
                }
                
                do {
                    return try parseJSON(T.self, from: data) as! T
                } catch {
                    throw NetworkError.parseError
                }
                                
            }.mapError { error in
                
                if let networkError = error as? NetworkError {
                    return networkError
                }
                
                return NetworkError.unknown
            }
            .eraseToAnyPublisher()
        

    }
}
