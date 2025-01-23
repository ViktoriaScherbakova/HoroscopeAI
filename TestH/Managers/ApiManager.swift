//
//  ApiManager.swift
//  TestH
//
//  Created by sherbakova on 11.08.2024.
//

import Foundation

enum NetworkServiceError: Error {
    case emptyResponse
}

final class ApiManager {
    
    private enum Constants {
        static let horoscopeUrl = "http://192.168.3.22:8082/zodus/api/v1/horoscopes"
    }
    
    static let shared = ApiManager()
    
    private init() {}
    
    func requestData<T:Decodable>(model: T.Type, completion: @escaping (Result<T?, Error>) -> Void) {
        guard let url = URL(string: Constants.horoscopeUrl) else {
            return
        }
        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(model, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(NetworkServiceError.emptyResponse))
            }
        }
        dataTask.resume()
    }
}
