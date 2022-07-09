//
//  ViewController.swift
//  Movie
//
//  Created by CHOI on 2022/07/04.
//

import UIKit

class ViewController: UIViewController {
    
    var movies: [String] = ["광해", "택시운전사", "괴물", "국제시장", "도둑들", "겨울왕국2"]

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var preview1ImageView: UIImageView!
    @IBOutlet weak var preview2ImageView: UIImageView!
    @IBOutlet weak var preview3ImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preview1ImageView.layer.cornerRadius = 50
        preview2ImageView.layer.cornerRadius = 50
        preview3ImageView.layer.cornerRadius = 50
        preview1ImageView.layer.borderColor = UIColor.lightGray.cgColor
        preview1ImageView.layer.borderWidth = 2
        preview2ImageView.layer.borderColor = UIColor.lightGray.cgColor
        preview2ImageView.layer.borderWidth = 2
        preview3ImageView.layer.borderColor = UIColor.lightGray.cgColor
        preview3ImageView.layer.borderWidth = 2
    }

    @IBAction func playButtonClicked(_ sender: UIButton) {
        backgroundImageView.image = UIImage(named: movies[Int.random(in: 0...5)])
    }
    
}

