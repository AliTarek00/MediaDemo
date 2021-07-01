//
//  MoyaAPIHelper.swift
//  RecipeDemo
//
//  Created by Ali Tarek on 6/17/21.
//

import Moya

class MoyaAPIHelper<T: TargetType>
{
    // MARK:- Properties
    
    private var provider: MoyaProvider<T>
    
    // MARK:- Init
    
    init(type: ServiceType)
    {
        let networkActivityClosure: NetworkActivityPlugin.NetworkActivityClosure =
            { (activity, _) in
                
                switch activity
                {
                case .began:
                    ActivityIndicator.startLoading()
                    
                case .ended:
                    ActivityIndicator.stopLoading()
                }
            }
        
        var plugins: [PluginType] = []
        
        let networkActivityPlugin = NetworkActivityPlugin(networkActivityClosure: networkActivityClosure)
        plugins.append(networkActivityPlugin)
        
        let networkLogger = NetworkLoggerPlugin()
        plugins.append(networkLogger)
        
        let serviceType = type == .live ? MoyaProvider<T>.neverStub : MoyaProvider<T>.immediatelyStub
        
        self.provider = MoyaProvider<T>(stubClosure: serviceType, plugins: plugins)
    }
    
    // MARK:- Methods
    
    func request<C: Codable>(targetCase: T,
                             completion: @escaping (Result<BaseAPIResponse<C>,
                                                           Error>) -> Void)
    {
        provider.request(targetCase) { result in
            switch result
            {
            case let .success(value):
                do
                    {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(BaseAPIResponse<C>.self, from: value.data)
                        completion(.success(response))
                    }
                catch(let error)
                {
                    completion(.failure(error))
                }
                
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
