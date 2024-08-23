//
//  CurrentTime.swift
//  Alarm2874
//
//  Created by Student on 2024/06/13.
//

import Foundation
import UIKit
    class CurrentTime{
       
        
        var timer: Timer?
        var currentTime: String?
        var df = DateFormatter()
        weak var delegate: SleepingViewController?

        init() {
            if timer == nil{
                //タイマーをセット、一秒ごとにupdateCurrentTimeを呼ぶ
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCurrentTime), userInfo: nil, repeats: true)
            }
        }

        @objc private func updateCurrentTime(){
            //フォーマットの指定
            df.dateFormat = "HH:mm"
            //時刻をUNIXから端末のタイムゾーンにする
            df.timeZone = TimeZone.current
            //現在の時間をフォーマットに従って文字列化を行う
            let timezoneDate = df.string(from: Date())
            currentTime = timezoneDate
            delegate?.updateTime(currentTime!)
        }
    }

   

        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


