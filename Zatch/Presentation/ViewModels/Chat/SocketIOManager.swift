//
//  SocketIOManager.swift
//  Zatch
//
//  Created by 박소윤 on 2023/06/22.
//

import Foundation
import SocketIO

//https://medium.com/cocoaacademymag/real-time-client-server-communication-with-socket-io-4311a79b0553

class SocketParser {

    static func convert<T: Decodable>(data: Any) throws -> T {
        let jsonData = try JSONSerialization.data(withJSONObject: data)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: jsonData)
    }

    static func convert<T: Decodable>(datas: [Any]) throws -> [T] {
        return try datas.map { (dict) -> T in
            let jsonData = try JSONSerialization.data(withJSONObject: dict)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: jsonData)
        }
    }

}

protocol SocketDelegate{
    func receive(message: ChatMessage)
}

class SocketIOManager {

    // MARK: - Properties
    let manager = SocketManager(socketURL: URL(string: "https://socket-io-chat.now.sh")!, config: [.log(false), .compress])
    var socket: SocketIOClient?
    var delegate: SocketDelegate?

    // MARK: - Life Cycle
    init() {
        setupSocket()
        setupSocketEvents()
        socket?.connect()
    }

    func stop() {
        socket?.disconnect()
        socket?.removeAllHandlers()
    }

    // MARK: - Socket Setup
    func setupSocket() {
        self.socket = manager.defaultSocket
    }

    func setupSocketEvents() {
        
        socket?.on(clientEvent: .connect) {data, ack in
            print("Connected")
        }

        socket?.on("login") { (data, ack) in
            guard let dataInfo = data.first else { return }
//            if let response: SocketLogin = try? SocketParser.convert(data: dataInfo) {
//                print("Now this chat has \(response.numUsers) users.")
//            }
        }

        socket?.on("user joined") { (data, ack) in
            guard let dataInfo = data.first else { return }
//            if let response: SocketUserJoin = try? SocketParser.convert(data: dataInfo) {
//                print("User '\(response.username)' joined...")
//                print("Now this chat has \(response.numUsers) users.")
//            }
        }

        socket?.on("user left") { (data, ack) in
            guard let dataInfo = data.first else { return }
//            if let response: SocketUserLeft = try? SocketParser.convert(data: dataInfo) {
//                print("User '\(response.username)' left...")
//                print("Now this chat has \(response.numUsers) users.")
//            }
        }

        socket?.on("new message") { (data, ack) in
            guard let dataInfo = data.first else { return }
            if let response: ChatMessage = try? SocketParser.convert(data: dataInfo) {
                self.delegate?.receive(message: response)
                print("Message from '\(response.nickname)': \(response.message)")
            }
        }
    }

    // MARK: - Socket Emits
    func register(user: String) {
        socket?.emit("add user", user)
    }

    func send(message: String) {
        socket?.emit("new message", message)
    }

}
