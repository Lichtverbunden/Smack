//
//  MessageService.swift
//  Smack
//
//  Created by Ken Krippeler on 29.08.17.
//  Copyright © 2017 Lichtverbunden. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService
{
    static let instance = MessageService()
    
    var channels = [Channel]()
    
    func findAllChannels(completion: @escaping CompletionHandler)
    {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers:
            BEARERHEADER).responseJSON
            { (response) in
                if response.result.error == nil
                {
                    guard let data = response.data else {return}
                    
                    if let json = JSON(data: data).array
                    {
                        for item in json
                        {
                            let name = item["name"].stringValue
                            let channelDescription = item["description"].stringValue
                            let id = item["_id"].stringValue

                            let channel = Channel(channelTitle: name, channelDescription: channelDescription, id: id)
                            self.channels.append(channel)
                        }
                        print(self.channels)
                        completion(true)
                    }
                }
                else
                {
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
            }
    }
}
