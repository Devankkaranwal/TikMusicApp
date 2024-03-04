//
//  DiscoverHeader.swift
//  TikMusicApp
//
//  Created by Devank on 23/02/24.
//

import UIKit
fileprivate let cellReuseId = "DiscoverHeadercellReuseId"
class DiscoverHeader: UICollectionViewCell {
    
    //MARK: - Init
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = .white
//        setUpViews()
//    }
    
    lazy var searchBar: UISearchBar = {
           let searchBar = UISearchBar()
           // Customize your search bar here
           searchBar.placeholder = "Search"
           return searchBar
       }()
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           backgroundColor = .white
           setUpViews()
           addSubview(searchBar)
           searchBar.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               searchBar.topAnchor.constraint(equalTo: topAnchor, constant: 10),
               searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
               searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
//               searchBar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
           ])

       }
    

    
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
       let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
//        cv.backgroundColor = .white
//        cv.showsHorizontalScrollIndicator = false
//        cv.isPagingEnabled = true
        return cv
    }()
    
    
//    fileprivate lazy var pageControl: UIPageControl = {
////        let pc = UIPageControl()
////        pc.numberOfPages = integerArray.count
////        pc.clipsToBounds = true
////        pc.layer.masksToBounds = true
////        return pc
//    }()
    
    
    
    //MARK: - Handlers
    
    fileprivate func setUpViews() {
        addSubview(collectionView)
       // addSubview(pageControl)
        collectionView.fillSuperview()
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellReuseId)
        
      //  pageControl.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 10, right: 20), size: .init(width: 0, height: 25))
    }
    
    
    
    
    //MARK: - Code Was Created by Devank All rights reserved.
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



//MARK: - CollectionView Delegates

extension DiscoverHeader: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseId, for: indexPath)
       // cell.backgroundColor = UIColor.random()//colors[indexPath.item]
        return cell
    }

    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1//colors.count
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: 20) // Adjust height as needed
//    }


    
}


//extension UIColor {
//    static func random() -> UIColor {
//        return UIColor(
//           red:   .random(),
//           green: .random(),
//           blue:  .random(),
//           alpha: 1.0
//        )
//    }
//}
//
////
//extension CGFloat {
//    static func random() -> CGFloat {
//        return CGFloat(arc4random()) / CGFloat(UInt32.max)
//    }
//}

