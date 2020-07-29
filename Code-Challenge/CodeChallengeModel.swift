//
//  CodeChallengeModel.swift
//  Code-Challenge
//
//  Created by Helios on 27/07/20.
//  Copyright © 2020 Axxess. All rights reserved.
//

import Foundation


class CodeChallengeModel : NSObject {

    var data : String!
    var date : String!
    var id : String!
    var type : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        data = dictionary["data"] as? String
        date = dictionary["date"] as? String
        id = dictionary["id"] as? String
        type = dictionary["type"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if data != nil{
            dictionary["data"] = data
        }
        if date != nil{
            dictionary["date"] = date
        }
        if id != nil{
            dictionary["id"] = id
        }
        if type != nil{
            dictionary["type"] = type
        }
        return dictionary
    }

}
