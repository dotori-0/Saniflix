//
//  MainViewController.swift
//  Movie
//
//  Created by SC on 2022/07/05.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!

    @IBOutlet weak var previewImage1: UIImageView!
    @IBOutlet weak var previewImage2: UIImageView!
    @IBOutlet weak var previewImage3: UIImageView!

    let backgroundImageArray = [UIImage(named: "7번방의선물"), UIImage(named: "국제시장"), UIImage(named: "아바타"), UIImage(named: "어벤져스엔드게임")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // 하단 이미지 뷰 원형으로
        previewImage1.layer.cornerRadius = previewImage1.frame.height / 2
        previewImage2.layer.cornerRadius = previewImage2.frame.height / 2
        previewImage3.layer.cornerRadius = previewImage3.frame.height / 2

        // 하단 이미지 뷰 테두리 굵기
        previewImage1.layer.borderWidth = 3
        previewImage2.layer.borderWidth = 3
        previewImage3.layer.borderWidth = 3

        // 하단 이미지 뷰 테두리 컬러
        previewImage1.layer.borderColor = UIColor(red: 73/255.0, green: 65/255.0, blue: 86/255.0, alpha: 1.0).cgColor
        previewImage2.layer.borderColor = CGColor(red: 76/255.0, green: 103/255.0, blue: 85/255.0, alpha: 1.0)
        previewImage3.layer.borderColor = CGColor(srgbRed: 108.0/255.0, green: 86.0/255.0, blue: 87.0/255.0, alpha: 1.0)

//        previewImage1.layer.borderColor = #colorLiteral(red: 0.3568021655, green: 0.327473551, blue: 0.4120190144, alpha: 1)
//        previewImage2.layer.borderColor = #colorLiteral(red: 0.369191885, green: 0.4757784009, blue: 0.4087293744, alpha: 1)
//        previewImage3.layer.borderColor = #colorLiteral(red: 0.4199380279, green: 0.3289179802, blue: 0.3323159814, alpha: 1)


//        previewImage3.layer.borderColor = UIColor(displayP3Red: 103, green: 85, blue: 85, alpha: 1.0).cgColor
//        previewImage3.layer.borderColor = UIColor(srgbRed: 94, green: 121, blue: 104, alpha: 1.0).cgColor


    }

    
// MARK: - Action

    @IBAction func playButtonClicked(_ sender: Any) {
        backgroundImage.image = backgroundImageArray[Int.random(in: 0...3)]
    }

}
