//
//  SleepingViewController.swift
//  Alarm2874
//
//  Created by Student on 2024/06/13.
//

import UIKit




class SleepingViewController: UIViewController {
    var wakeUpTime: Date? // 起床時間を保持するプロパティ
    // タッチ開始時のUIViewのorigin
    var orgOrigin: CGPoint!
    // タッチ開始時の親ビュー上のタッチ位置
    var orgParentPoint : CGPoint!
    
   
    var imageViews: [UIImageView] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // 画像を追加するメソッドを呼び出す例
        addImageView(image: UIImage(named: "shin1")!, at: CGPoint(x: 100, y: 100))
        addImageView(image: UIImage(named: "shin2")!, at: CGPoint(x: 200, y: 200))
        addImageView(image: UIImage(named: "shin3")!, at: CGPoint(x: 150, y: 300))
        addImageView(image: UIImage(named: "shin4")!, at: CGPoint(x: 50, y: 100))
        // 必要に応じて他の画像も追加する
    }

    func addImageView(image: UIImage, at position: CGPoint) {
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: position.x, y: position.y, width: 350, height:500) // 画像のサイズや位置を設定する
        imageView.isUserInteractionEnabled = true // ユーザーの操作を可能にする
        self.view.addSubview(imageView)

        // ドラッグ操作を追加する
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        imageView.addGestureRecognizer(panGesture)

        // 画像ビューを配列に追加する
        imageViews.append(imageView)
    }

    @objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard let imageView = gestureRecognizer.view as? UIImageView else { return }
        let translation = gestureRecognizer.translation(in: self.view)

        imageView.center = CGPoint(x: imageView.center.x + translation.x,
                                   y: imageView.center.y + translation.y)

        gestureRecognizer.setTranslation(CGPoint.zero, in: self.view)
    }


    // Viewのパンジェスチャーに反応し、処理するためのメソッド
   

    
  
        // ビューを2つ作成し、Subviewとして追加する
        // !!注意!!
        //UIGestureRecognizerのインスタンスは複数のViewで使いまわせないので、各View毎に作成する
        
        //インスタンスを生成
        var currentTime = CurrentTime()
        func updateTime(_ time:String) {
            
        }
        
        var tapCount: Int = 0
        
        func initEveryone(){
            self.tapCount = 0
        }
        
        @IBAction func ButtonTap(_ sender: UIButton) {
            // Buttonの座標をランダムに変更する
            // 全画面のサイズ取得
            let screenSize = self.view.frame.size
            // 押下したボタンのサイズ取得
            let buttonSize = sender.frame.size
            
            let xDimention = CGFloat.random(in: 0...(screenSize.width - buttonSize.width))
            let yDimention = CGFloat.random(in: 20...(screenSize.height - buttonSize.height - 40))
            
            sender.frame.origin = CGPoint(x: xDimention, y: yDimention)
            self.tapCount+=1
            if(self.tapCount >= 15){
                let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SetViewController") as! SetViewController
                self.present(secondViewController, animated: true, completion: nil)
                
                
            }
        }
        
    }
    























