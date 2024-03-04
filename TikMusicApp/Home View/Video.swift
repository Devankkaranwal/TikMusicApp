//
//  Video.swift
//  TikMusicApp
//
//  Created by Devank on 23/02/24.
//

import AVFoundation
import UIKit
import AVKit


struct Video : Identifiable {
    var id : Int
    var player : AVQueuePlayer
}


class VideoDataSource {
    static let sharedInstance = VideoDataSource()
    var looper: AVPlayerLooper?

    var currentIndex = 0 {
        willSet {
            videos[currentIndex].player.seek(to: .zero)
            videos[currentIndex].player.pause()
            if let looper = looper {
                looper.disableLooping()
            }
        }
        
        didSet {
            guard let currentItem = videos[currentIndex].player.currentItem else {
                print("Failed to create AVPlayerLooper. Player or currentItem is nil.")
                return
            }
            looper = AVPlayerLooper(player: videos[currentIndex].player, templateItem: currentItem)
            videos[currentIndex].player.play()
        }


    }

    func pause() {
        videos[currentIndex].player.pause()
    }

    func resume() {
        guard videos[currentIndex].player.rate == 0 else {
            return
        }
        videos[currentIndex].player.play()
    }

    var videos = [Video]()

    init() {
        if let url = Bundle.main.url(forResource: "Haryanvi WhatsApp Status _ He _ Rawme Hooda _ Pranjal Dahiya _ Latest Haryanvi Status 2023", withExtension: "mp4") {
            let player = AVQueuePlayer(url: url)
            videos.append(Video(id: 0, player: player))
        } else {
            print("Failed to load Data.mp4")
        }

//        if let url = Bundle.main.url(forResource: "2", withExtension: "mp4") {
//            let player = AVQueuePlayer(url: url)
//            videos.append(Video(id: 1, player: player))
//        } else {
//            print("Failed to load 2.mp4")
//        }
//        
//        
//        if let url = Bundle.main.url(forResource: "3", withExtension: "mp4") {
//            let player = AVQueuePlayer(url: url)
//            videos.append(Video(id: 2, player: player))
//        } else {
//            print("Failed to load 3.mp4")
//        }
//        
//        
//        if let url = Bundle.main.url(forResource: "4", withExtension: "mp4") {
//            let player = AVQueuePlayer(url: url)
//            videos.append(Video(id: 3, player: player))
//        } else {
//            print("Failed to load 4.mp4")
//        }
//        
//        
//        if let url = Bundle.main.url(forResource: "5", withExtension: "mp4") {
//            let player = AVQueuePlayer(url: url)
//            videos.append(Video(id: 4, player: player))
//        } else {
//            print("Failed to load 5.mp4")
//        }
//        
//        
//        if let url = Bundle.main.url(forResource: "6", withExtension: "mp4") {
//            let player = AVQueuePlayer(url: url)
//            videos.append(Video(id: 5, player: player))
//        } else {
//            print("Failed to load 6.mp4")
//        }

        
    }
}
