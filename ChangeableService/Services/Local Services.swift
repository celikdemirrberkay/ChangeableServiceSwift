//
//  Local Services.swift
//  ChangeableService
//
//  Created by Berkay  on 21.03.2023.
//

import Foundation

class LocalServices : IUserServicesProtocol {
    
    var networkType: String = "Localservice"
    func getDataFromAPI(_ resource: String) async throws -> [User] {
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else{
            fatalError("Resource not found !")
        }
        let data = try Data(contentsOf: URL(filePath: path))
        return try JSONDecoder().decode([User].self, from: data)
    }
    
    
    
    
    
    
    
}
