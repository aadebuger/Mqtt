//
//  PubrecPacket.swift
//  Mqtt
//
//  Created by Heee on 16/2/2.
//  Copyright © 2016年 hjianbo.me. All rights reserved.
//

import Foundation

/**
 PUBREC Packet is the response to a PUBLISH Packet with QoS 2. It is the second packet of the QoS
 2 protocol exchange.
 
 **Fix Header:**
  1. *Remaining Length field:* This is the length of the variable header.
                               For the PUBREC Packet this has the value 2.
 
 **Variable Header:**
 The variable header contains the Packet Identifier from the PUBLISH Packet that is being acknowledged.
 
 **Payload:**
 The PUBREC Packet has no payload.

 */
struct PubRecPacket: Packet {
    
    var fixHeader: PacketFixHeader
    
    var packetId: UInt16
    
    var varHeader: Array<UInt8> {
        return packetId.bytes
    }
    
    var payload = [UInt8]()
    
    init(packetId: UInt16) {
        fixHeader = PacketFixHeader(type: .pubrec)
        self.packetId = packetId
    }
    
    init(header: PacketFixHeader, bytes: [UInt8]) {
        self.fixHeader = header
        
        packetId = UInt16(bytes[0]*127 + bytes[1])
    }
}
