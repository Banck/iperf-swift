//
//  File.swift
//  
//
//  Created by Igor Kim on 08.11.20.
//

import Foundation
import IperfCLib

public enum IperfProtocol {
    case tcp
    case udp
    case sctp
    
    public var iperfConfigValue: Int32 {
        switch self {
        case .tcp:
            return Ptcp
        case .udp:
            return Pudp
        case .sctp:
            return Psctp
        }
    }
}

public enum IperfRole: Int8 {
    case server = 115
    case client = 99
}

public enum IperfDirection: Int32 {
    case download = 1
    case upload = 0
}


public struct IperfClientAuth {
    let userName: String
    let password: String
    let rsaBase64PublicKey: String

    public init(userName: String, password: String, rsaBase64PublicKey: String) {
        self.userName = userName
        self.password = password
        self.rsaBase64PublicKey = rsaBase64PublicKey
    }
}

public struct IperfConfiguration {
    public var address: String
    public var port: Int
    public var numStreams: Int
    public var role: IperfRole
    public var reverse: IperfDirection
    public var prot: IperfProtocol
    
    public var rate: UInt64
    
    public var duration: TimeInterval?
    public var timeout: TimeInterval?
    public var tos: Int?
    
    public var reporterInterval: TimeInterval?
    public var statsInterval: TimeInterval?
    public var clientAuth: IperfClientAuth?

    public init(
        address: String,
        port: Int = 5201,
        numStreams: Int = 2,
        role: IperfRole = .client,
        reverse: IperfDirection = .download,
        prot: IperfProtocol = .tcp,
        rate: UInt64 = 1024 * 1024,
        duration: TimeInterval? = nil,
        timeout: TimeInterval? = nil,
        tos: Int? = nil,
        reporterInterval: TimeInterval? = nil,
        statsInterval: TimeInterval? = nil,
        clientAuth: IperfClientAuth? = nil
    ) {
        self.address = address
        self.numStreams = numStreams
        self.role = role
        self.reverse = reverse
        self.port = port
        self.prot = prot
        self.rate = rate
        self.duration = duration
        self.timeout = timeout
        self.tos = tos
        self.reporterInterval = reporterInterval
        self.statsInterval = statsInterval
        self.clientAuth = clientAuth
    }
}
