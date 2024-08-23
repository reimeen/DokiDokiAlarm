import UIKit

class SetViewController: UIViewController {
    var alarm: Alarm?
    @IBOutlet var sleepTimePicker: UIDatePicker!
        override func viewDidLoad() {
            super.viewDidLoad()
            alarm = Alarm()
            // UIDatePickerを.timeモードにする
            sleepTimePicker.datePickerMode = .time
            // 現在の時間をDatePickerに表示
            sleepTimePicker.setDate(Date(), animated: false)
        }

    @IBAction func alarmBtnWasPressed(_ sender: UIButton) {
        alarm?.selectedWakeUpTime = sleepTimePicker.date
        alarm?.startAlarm()
        performSegue(withIdentifier: "setToSleeping", sender: nil)
    }

    @IBAction func musicstop(_ sender: Any) {
        alarm?.stopAlarm()
        
    }
}

