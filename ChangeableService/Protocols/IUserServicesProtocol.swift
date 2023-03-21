//
//  IUserServicesProtocol.swift
//  ChangeableService
//
//  Created by Berkay  on 21.03.2023.
//

import Foundation


protocol IUserServicesProtocol {
    
    func getDataFromAPI(_ resource: String) async throws -> [User]
    var networkType : String{get}
    
    
}
