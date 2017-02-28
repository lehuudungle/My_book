//
//  ViewBook.swift
//  MyBook
//
//  Created by Admin on 2/23/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewBook: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var type: String!
    
    let booksPDF = [
        ("abrieferhistory"),
        ("aspoofonsexdonwireman"),
        ("barrysworldjenvey"),
        ("foreigneduwilliam"),
        ("gonewithtrash"),
        ("gospelbuckydennis"),
        ("oddjobsbowling"),
        ("oneclownshortwright"),
        ("questingromana"),
        ("thedistancetravelled")
    ]
    let booksHTML = [
        ("Lập trình iOS Objective-C")
        
    ]
    let booksDocx = [
        ("coexistcrane"),
        ("darkkisssylviaday"),
        ("isthislove"),
        ("lovelikethishubbard"),
        ("lumberlacewards")
    ]

   // mỗi khi click vào nút tab bar item mới thì nó load lại viewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        type = self.tabBarItem.title
        print("load viewdidLoad: \(type)")
        
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count : Int!
        print("anh\(type)")
        switch type {
        case "PDF": count = booksPDF.count
        print(count)
        case "DOCX": count = booksDocx.count
        print("docx\(count)")
        case "HTML": count = booksHTML.count
        print("html \(count)")
        default:
            break
        }
        return count
        
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CellCollection", forIndexPath: indexPath) as! ACellBook
        var thubImg: UIImage!
        var nameLabel: String!
        switch type {
        case "PDF": thubImg = UIImage(named: (booksPDF[indexPath.item] + ".jpg"))
            nameLabel = booksPDF[indexPath.item]
        case "DOCX": thubImg = UIImage(named: (booksDocx[indexPath.item] + ".jpg"))
            nameLabel = booksDocx[indexPath.item]
        case "HTML": thubImg = UIImage(named: (booksHTML[indexPath.item] + ".jpg"))
            nameLabel = booksHTML[indexPath.item]
        default:
            break
        }
        cell.imageView.image = thubImg
        cell.nameLabel.text = nameLabel
        
        return cell
        
        
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let viewDetailBook = self.storyboard?.instantiateViewControllerWithIdentifier("DetailBook") as! DetailBook
        var urlString : String!
        switch type {
        case "PDF": urlString = booksPDF[indexPath.item]
        case "DOCX": urlString = booksDocx[indexPath.item]
        case "HTML": urlString = booksHTML[indexPath.item]
        default:
            break
        }
        viewDetailBook.urlString = urlString
        viewDetailBook.type = type
        self.navigationController?.pushViewController(viewDetailBook, animated: true)
    }

}
