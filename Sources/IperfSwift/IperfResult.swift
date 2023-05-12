//
//  IperfResult.swift
//  IperfSwift
//
//  Created by Sakhabaev Egor on 12.05.2023.
//

import Foundation

public struct IperfResult: Identifiable {
    public var id = UUID()

    public var totalBytes: UInt64
    public var totalPackets: Int32
    public var totalLostPackets: Int32
    public var totalOutoforderPackets: Int32
    public var averageJitter: Double
    public var throughput: IperfThroughput
    public var duration: Int32

    public init(
        id: UUID = UUID(),
        totalBytes: UInt64,
        totalPackets: Int32,
        totalLostPackets: Int32,
        totalOutoforderPackets: Int32,
        averageJitter: Double,
        duration: Int32
    ) {
        self.id = id
        self.totalBytes = totalBytes
        self.totalPackets = totalPackets
        self.totalLostPackets = totalLostPackets
        self.totalOutoforderPackets = totalOutoforderPackets
        self.averageJitter = averageJitter
        self.duration = duration
        throughput = IperfThroughput(bytes: totalBytes, seconds: Double(duration))
    }
}
