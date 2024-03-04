//
//  MediaPlayerView.swift
//  TikMusicApp
//
//  Created by Devank on 23/02/24.
//

import UIKit
import AVFoundation

class MediaPlayerView: UIView{
    private var player: AVQueuePlayer!
    private var playerLayer: AVPlayerLayer!
    private var playerItem: AVPlayerItem!
    private var playerLooper: AVPlayerLooper!
    
    deinit {
        player.pause()
        playerItem = nil
    }
    
    init(frame: CGRect, videoURL: URL) {
        super.init(frame: frame)
        self.clipsToBounds = true
        self.layer.cornerRadius = 12.0
        player = AVQueuePlayer()
        playerLayer = AVPlayerLayer(player: player)
        playerItem = AVPlayerItem(url: videoURL)
        playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        playerLayer.frame = self.layer.bounds
        playerLayer.cornerRadius = 12.0
        self.layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func play(){
        player.play()
    }
    
    func pause(){
        player.pause()
    }
    
    
}
