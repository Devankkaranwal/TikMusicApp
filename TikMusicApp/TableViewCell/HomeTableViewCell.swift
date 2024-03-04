//
//  HomeTableViewCell.swift
//  TikMusicApp
//
//  Created by Devank on 23/02/24.
//


import UIKit
import AVFoundation
import MarqueeLabel


class HomeTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
  
    @IBOutlet weak var playerView: UIView!
    var player: AVQueuePlayer?
    @IBOutlet weak var nameBtn: UIButton!
    @IBOutlet weak var captionLbl: UILabel!
    @IBOutlet weak var musicLbl: MarqueeLabel!
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var followBtn: UIButton!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var likeCountLbl: UILabel!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var commentCountLbl: UILabel!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var musicBtn: UIButton!
    @IBOutlet weak var shareCountLbl: UILabel!
    @IBOutlet weak var pauseImgView: UIImageView!{
        didSet{
            pauseImgView.alpha = 0
        }
    }
    
    // MARK: - Variables
    private(set) var isPlaying = false
    private(set) var liked = false
    
    var isFullScreen = false
    
  
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImgView.makeRounded(color: .white, borderWidth: 1)
        followBtn.makeRounded(color: .clear, borderWidth: 0)
        musicBtn.makeRounded(color: .clear, borderWidth: 0)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        musicLbl.holdScrolling = true
        musicLbl.animationDelay = 0
        
        
        let tapGesturepauseandplay = UITapGestureRecognizer(target: self, action: #selector(handleTapGesturepauseandplay(_:)))
        playerView.addGestureRecognizer(tapGesturepauseandplay)
        
//
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
//            playerView.addGestureRecognizer(tapGesture)
//            tapGesture.delegate = self
        
        
        let likeDoubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleLikeGesture(sender:)))
        likeDoubleTapGesture.numberOfTapsRequired = 2
        self.contentView.addGestureRecognizer(likeDoubleTapGesture)
        
        tapGesturepauseandplay.require(toFail: likeDoubleTapGesture)
    }
    


    
    func setup(with video: Video) {
         guard let playerView = playerView else { return }
         let player = video.player
         let playerLayer = AVPlayerLayer(player: player)
         playerLayer.frame = playerView.bounds
         playerView.layer.addSublayer(playerLayer)
         self.player = player // Assign player to the player property
         player.play()
     }

    
    @objc func handleTapGesturepauseandplay(_ gesture: UITapGestureRecognizer) {
          if let player = player {
              if player.rate == 0 {
                  player.play()
              } else {
                  player.pause()
              }
          }
      }

    
    @objc func handleTapGesture(_ gesture: UITapGestureRecognizer) {
        if isFullScreen {
            // Restore normal size
            playerView.frame = contentView.bounds
        } else {
            // Expand to full screen
            playerView.frame = UIScreen.main.bounds
        }
        isFullScreen = !isFullScreen
    }




    
    // MARK: - Actions
    // Like Video Actions
    @IBAction func like(_ sender: Any) {
        if !liked {
            likeVideo()
        } else {
            liked = false
            likeBtn.tintColor = .white
        }
        
    }
    
    @objc func likeVideo(){
        if !liked {
            liked = true
            likeBtn.tintColor = .red
        }
    }
    
    // Heart Animation with random angle
    @objc func handleLikeGesture(sender: UITapGestureRecognizer){
        let location = sender.location(in: self)
        let heartView = UIImageView(image: UIImage(systemName: "heart.fill"))
        heartView.tintColor = .red
        let width : CGFloat = 110
        heartView.contentMode = .scaleAspectFit
        heartView.frame = CGRect(x: location.x - width / 2, y: location.y - width / 2, width: width, height: width)
        heartView.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: -CGFloat.pi * 0.2...CGFloat.pi * 0.2))
        self.contentView.addSubview(heartView)
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 3, options: [.curveEaseInOut], animations: {
            heartView.transform = heartView.transform.scaledBy(x: 0.85, y: 0.85)
        }, completion: { _ in
            UIView.animate(withDuration: 0.4, delay: 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 3, options: [.curveEaseInOut], animations: {
                heartView.transform = heartView.transform.scaledBy(x: 2.3, y: 2.3)
                heartView.alpha = 0
            }, completion: { _ in
                heartView.removeFromSuperview()
            })
        })
        likeVideo()
    }
    
    @IBAction func comment(_ sender: Any) {
    CommentPopUpView.init().show()
    }
    
    @IBAction func share(_ sender: Any) {
        
    }
    
}



