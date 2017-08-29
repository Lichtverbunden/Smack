//
//  Channel.swift
//  Smack
//
//  Created by Ken Krippeler on 29.08.17.
//  Copyright © 2017 Lichtverbunden. All rights reserved.
//

import Foundation

struct Channel: Decodable
{
    public private(set) var channelTitle: String!
    public private(set) var channelDescription: String!
    public private(set) var id: String!
}
