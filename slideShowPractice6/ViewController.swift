//
//  ViewController.swift
//  slideShowPractice6
//
//  Created by 鈴木健太 on 2022/07/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var SusumuButton: UIButton!
    @IBOutlet weak var ModoruButton: UIButton!
    @IBOutlet weak var playOrStopButton: UIButton!
    
    //    現在のビューコントローラのストーリーボードファイルから、指定された識別子でセグエを開始する。
    @IBAction func tapImageView(_ sender: Any) {
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    //    遷移する際に何かしらの処理を行いたい場合はこのメソッド内に書く。遷移が始まると、自動で呼び出される。Segue objects contain information about the view controllers involved in a transition. When a segue is triggered, but before the visual transition occurs, the storyboard runtime calls the current view controller’s prepare(for:sender:) method so that it can pass any needed data to the view controller that is about to be displayed.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController2: ViewController2 = segue.destination as! ViewController2
        viewController2.enmptyImage = imageView.image!
        
        if timer != nil{
            
            timer.invalidate()
            playOrStopButton.setTitle("再生", for: .normal)
            playOrStopButton.titleLabel?.textAlignment = NSTextAlignment.center
            
            timer = nil
        }
    }
    
    var indexNum: Int = 0
    var indexNum2: Int = 0
    var timer: Timer!
    
    
    let imageArray: [UIImage] = [
        UIImage(named: "download.jpg")!,
        UIImage(named: "download-1.jpg")!,
        UIImage(named: "download-2.jpg")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let sampleImage1 = UIImage(named: "download.jpg")
        imageView.image = sampleImage1
    }
    
    
    @IBAction func button(_ sender: Any) {
        
        if indexNum == imageArray.count - 1{
            indexNum = 0
            imageView.image = imageArray[indexNum]
        } else {
            indexNum += 1
            imageView.image = imageArray[indexNum]
        }
    }
    
    @IBAction func button1(_ sender: Any) {
        
        if indexNum == 0 {
            indexNum = imageArray.count - 1
            imageView.image = imageArray[indexNum]
        } else {
            indexNum -= 1
            imageView.image = imageArray[indexNum]
        }
        
    }
    
    
    @IBAction func button2(_ sender: Any) {
        
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            playOrStopButton.setTitle("停止", for: .normal)
            
            SusumuButton.isEnabled = false
            ModoruButton.isEnabled = false
            SusumuButton.setTitle("タップ不可", for: .normal)
            ModoruButton.setTitle("タップ不可", for: .normal)
            SusumuButton.titleLabel?.textAlignment = NSTextAlignment.center
            ModoruButton.titleLabel?.textAlignment = NSTextAlignment.center
            
        } else {
            
            timer.invalidate()
            timer = nil
            
            playOrStopButton.setTitle("再生", for: .normal)
            
            SusumuButton.isEnabled = true
            ModoruButton.isEnabled = true
            SusumuButton.setTitle("進む", for: .normal)
            ModoruButton.setTitle("戻る", for: .normal)
            
        }
        
        
    }
    
    @objc func changeImage() -> Void{
        
        if indexNum2 == imageArray.count - 1{
            imageView.image = imageArray[imageArray.count - 1]
            indexNum2 = 0
        } else {
            
            imageView.image = imageArray[indexNum2]
            indexNum2 += 1
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue){
    }
    
    
    
}

