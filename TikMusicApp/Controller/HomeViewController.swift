//
//  HomeViewController.swift
//  TikMusicApp
//
//  Created by Devank on 23/02/24.
//

import UIKit
import AVKit
import AVFoundation

class HomeViewController: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    //let cellId = "HomeTableViewCell"
    
    let cellId = "Home"
    @objc dynamic var currentIndex = 0

    override func viewDidLoad() {
    super.viewDidLoad()
        setupView()
        }
    
    
    /// Set up Views
    func setupView(){
        // Table View
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        
        // to ignore safe area...
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.isPagingEnabled = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        VideoDataSource.sharedInstance.resume()
    }

    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        VideoDataSource.sharedInstance.pause()
    }
    
  
}



// MARK: - Table View Extensions

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return VideoDataSource.sharedInstance.videos.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HomeTableViewCell
            let video = VideoDataSource.sharedInstance.videos[indexPath.row]
            cell.setup(with: video)
            return cell
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 720 // or any other desired height
    }
    
//    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if let cell = cell as? HomeTableViewCell {
//            cell.pauseVideo()
//        }
   // }
}


// MARK: - ScrollView Extension
extension HomeViewController: UIScrollViewDelegate {

//
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.y / UIScreen.main.bounds.height)
        
        if VideoDataSource.sharedInstance.currentIndex != index {
            VideoDataSource.sharedInstance.currentIndex = index
        }
    }

    
}
