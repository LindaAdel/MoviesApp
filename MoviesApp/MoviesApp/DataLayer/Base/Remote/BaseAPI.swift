//
//  BaseAPI.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation
import Alamofire
import Combine

class BaseAPI {
    
    func request<T: Decodable>(request: URLRequestConvertible, responseType: T.Type, isRequestRequireAuthorization: Bool = true, showDefaultAlertError: Bool) -> AnyPublisher<T, APIError> {
        return Future<T, APIError> { promise in
            guard NetworkManager.IS_CONNECTED_TO_INTERNET else {
                NotificationCenter.default.post(
                    name: NSNotification.Name(rawValue: "NetworkMessage"),
                    object: "Please check your internet connection"
                )
                promise(.failure(APIError.connectionError))
                return
            }
            AF.request(request).validate().responseDecodable(of: T.self, queue: .main) { afResponse in
                var returnedError: APIError?
                switch afResponse.result {
                case .failure(_):
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NetworkMessage"), object: returnedError?.message)
                    if let httpResponse = afResponse.response {
                        returnedError = self.handleAPIError(httpResponse: httpResponse, responseData: afResponse.data)
                        if showDefaultAlertError {
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NetworkMessage"), object: returnedError?.message)
                            if !isRequestRequireAuthorization {
                                promise(.failure(returnedError ?? .errorOccured))
                            }
                        } else {
                            promise(.failure(returnedError ?? .errorOccured))
                        }
                    }
                    if let error = returnedError {
                    }
                case .success(let value):
                    promise(.success(value))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    
    func handleAPIError(httpResponse: HTTPURLResponse, responseData: Data?) -> APIError? {
        if httpResponse.statusCode == 401 ||  httpResponse.statusCode == 400 || httpResponse.statusCode == 405 || httpResponse.statusCode == 404 || httpResponse.statusCode == 500
            || httpResponse.statusCode == 403 {
            
            var apiError: APIError? = nil
            if let data  = responseData {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                    if let errors = json?["meta"] as? [String: Any], !errors.isEmpty {
                        apiError = APIError(responseCode: httpResponse.statusCode, customError: errors["message"] as? String)
                    }
                } catch {
                }
            }
    
            if apiError == nil {
                apiError = APIError(responseCode: httpResponse.statusCode)
            }
            return apiError
        }
        return .errorOccured
    }
   
}
