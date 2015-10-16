//
//  CollectionViewController.swift
//  DiSanFangKu
//
//  Created by xly on 15/8/22.
//  Copyright (c) 2015年 Lily. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController ,HZPhotoBrowserDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    //每一个方框就是一个Cell
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return 20
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) 
    
        // Configure the cell
        let image = UIImageView(frame: CGRectMake(0, 0, 87, 80))
        image.image = UIImage(named: "cute_girl.jpg")
        cell.contentView.addSubview(image)
    
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = self.collectionView?.cellForItemAtIndexPath(indexPath)
        
        Browser(cell!.contentView)
    }
    
    func Browser(view:UIView){
        let BrowserVC = HZPhotoBrowser()
        BrowserVC.sourceImagesContainerView = view
        BrowserVC.imageCount = 1
        BrowserVC.currentImageIndex = 0
        BrowserVC.delegate = self
        BrowserVC.show()
    }

    //备用图片
    func photoBrowser(browser: HZPhotoBrowser!, placeholderImageForIndex index: Int) -> UIImage! {
        return UIImage(named: "cute_girl.jpg")
    }
    
    //路径
    func photoBrowser(browser: HZPhotoBrowser!, highQualityImageURLForIndex index: Int) -> NSURL! {
        let url = NSURL(string: "http://ac-hn8w3hlp.clouddn.com/dGWm2GEFNFoisI6beHBUQjD.png")
        return url
    }

}
