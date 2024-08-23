import Foundation
import AVFoundation

class Alarm {
    var selectedWakeUpTime: Date?
    var sleepTimer: Timer?
    var seconds = 0

    func stop() {
        AudioManager.shared.stopPlayingSound()
    }

    func stopTimer() {
        sleepTimer?.invalidate()
        sleepTimer = nil
        AudioManager.shared.stopPlayingSound()
    }

    func runTimer() {
        guard let wakeUpTime = selectedWakeUpTime else { return }
        seconds = calculateInterval(userAwakeTime: wakeUpTime)

        if sleepTimer == nil {
            sleepTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }

    @objc private func updateTimer() {
        if seconds > 0 {
            seconds -= 1
            print(seconds)
        } else {
            AudioManager.shared.startPlayingSound()
            sleepTimer?.invalidate()
            sleepTimer = nil
        }
    }

    private func calculateInterval(userAwakeTime: Date) -> Int {
        let now = Date()
        let calendar = Calendar.current
        let targetComponents = calendar.dateComponents([.hour, .minute], from: userAwakeTime)
        let targetDate = calendar.date(bySettingHour: targetComponents.hour ?? 0, minute: targetComponents.minute ?? 0, second: 0, of: now) ?? now
        var interval = Int(targetDate.timeIntervalSince(now))

        if interval < 0 {
            interval += 86400 // 1日の秒数
        }

        return interval
    }
}

