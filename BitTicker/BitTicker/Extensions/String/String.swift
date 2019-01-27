//
//  String.swift
// 
//  Created by Ivan Yordanov
//

import Foundation
import CommonCrypto

// Defines types of hash string outputs available
public enum HashOutputType {
    
    // standard hex string output
    case hex
    // base 64 encoded string output
    case base64
    
}

// Defines types of hash algorithms available
public enum HashType {
    
    case md5
    case sha1
    case sha224
    case sha256
    case sha384
    case sha512
    
    var length: Int32 {
        switch self {
        case .md5: return CC_MD5_DIGEST_LENGTH
        case .sha1: return CC_SHA1_DIGEST_LENGTH
        case .sha224: return CC_SHA224_DIGEST_LENGTH
        case .sha256: return CC_SHA256_DIGEST_LENGTH
        case .sha384: return CC_SHA384_DIGEST_LENGTH
        case .sha512: return CC_SHA512_DIGEST_LENGTH
        }
    }
    
}

public extension String {
    
    /// Hashing algorithm for hashing a string instance.
    ///
    /// - Parameters:
    ///   - type: The type of hash to use.
    ///   - output: The type of output desired, defaults to .hex.
    /// - Returns: The requested hash output or nil if failure.
    public func hashed(_ type: HashType, output: HashOutputType = .hex) -> String? {
        
        // convert string to utf8 encoded data
        guard let message = data(using: .utf8) else { return nil }
        return message.hashed(type, output: output)
    }
    
    public func isEmptyOrWhitespace() -> Bool {
        if self.isEmpty  { return true }
        return (self.trimmingCharacters(in: NSCharacterSet.whitespaces) == "")
    }
    
    public func condenseWhitespaces() -> String {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }

}

public extension String {
    func toBool() -> Bool{
        if self == "0" {
            return false
        }else{
            return true
        }
    }
}

public extension String {
    func replaceUnderScore() -> String {
        return self.replacingOccurrences(of: "_", with: " - ")
    }
}
