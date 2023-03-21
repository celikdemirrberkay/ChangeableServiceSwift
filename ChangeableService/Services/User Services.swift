//
//  User Services.swift
//  ChangeableService
//
//  Created by Berkay  on 21.03.2023.
//

import Foundation

enum NetworkError : Error {
    case invalidURL
    case invalidServerResponse
}



class UserWebServices : IUserServicesProtocol {
    
    var networkType: String = "Webservices"
    func getDataFromAPI(_ resource: String) async throws -> [User]{
        
        guard let url = URL(string: resource) else{
            throw NetworkError.invalidURL
        }
        let (data,response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse , httpResponse.statusCode == 200 else{
            throw NetworkError.invalidServerResponse
        }
        return try JSONDecoder().decode([User]?.self, from: data) ?? []
        
    }

}


