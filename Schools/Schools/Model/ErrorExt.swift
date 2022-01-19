//
//  ErrorExt.swift
//  Schools
//
//  Created by Ahmad MacBook on 12/01/2022.
//

import Foundation
import Firebase


public extension Error {
    
    var localizedDescription: String {
        
        let error = self as NSError
        
        if error.domain == AuthErrorDomain {
            
            if let code = AuthErrorCode(rawValue: error.code) {
                
                if let errorString = code.description {
                    
                    return errorString
                }
            }
        }
        return error.localizedDescription
    }
}
