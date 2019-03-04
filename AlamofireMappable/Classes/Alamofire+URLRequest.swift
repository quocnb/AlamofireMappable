//
//  Alamofire+URLRequest.swift
//  Pods
//
//  Created by Quoc Nguyen on 2019/03/04.
//

import Alamofire

public extension URLRequest {
    mutating func setHeaders(_ headers: Parameters?) {
        guard let params = headers else {
            return
        }
        for (key, value) in params {
            self.setValue(value as? String, forHTTPHeaderField: key)
        }
    }

    mutating func setParams(_ params: Parameters?) {
        guard let query = params else {
            return
        }
        do {
            if self.httpMethod == HTTPMethod.get.rawValue {
                self = try Alamofire.URLEncoding.default.encode(self, with: query)
            } else {
                self = try Alamofire.JSONEncoding.default.encode(self, with: query)
            }
        } catch {
        }
    }
}
