//
//  Alamofire+ObjectMapper.swift
//  AlamofireMapper
//
//  Created by Quoc Nguyen on 2019/03/04.
//

import Alamofire
import ObjectMapper

public extension DataRequest {
    func responseObject<T: Mappable>(_ success: ((T) -> Void)?, fail: ((Error) -> Void)?) {
        self.responseJSON { (response) in
            response.parseObject(success).catchFail(fail)
        }
    }

    func responseArray<T: Mappable>(_ success: (([T]) -> Void)?, fail: ((Error) -> Void)?) {
        self.responseJSON { (response) in
            response.parseArray(success).catchFail(fail)
        }
    }
}

public extension DataResponse {
    @discardableResult
    func catchResponse(code: Int, action: ((HTTPURLResponse?, Result<Value>) -> Void)?) -> DataResponse {
        if self.response?.statusCode == code {
            action?(self.response, self.result)
        }
        return self
    }

    @discardableResult
    func parseObject<T: Mappable>(_ success: ((T) -> Void)?) -> DataResponse {
        switch self.result {
        case .success(let value):
            if let json = value as? Parameters,
                let object = Mapper<T>().map(JSON: json) {
                success?(object)
            } else if let json = value as? [Parameters],
                let object = Mapper<T>().mapArray(JSONArray: json).compactMap({$0}).first {
                success?(object)
            }
        default:
            break
        }
        return self
    }

    @discardableResult
    public func parseArray<T: Mappable>(_ success: (([T]) -> Void)?) -> DataResponse {
        switch self.result {
        case .success(let value):
            if let json = value as? [Parameters] {
                let objects = Mapper<T>().mapArray(JSONArray: json).compactMap({$0})
                success?(objects)
            }
        default:
            break
        }
        return self
    }

    @discardableResult
    func catchFail(_ fail: ((Error) -> Void)?) -> DataResponse {
        switch self.result {
        case .failure(let error):
            fail?(error)
        default:
            break
        }
        return self
    }
}
