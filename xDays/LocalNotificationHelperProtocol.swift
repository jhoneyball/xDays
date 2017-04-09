
import UIKit

protocol LocalNotificaitonHelperProtocol {
    
    func addNotification(fireDate: Date,
                         alertBody: String,
                         alertAction: String,
                         applicationBadgeNumber: Int)
    func clearCurrentNotifications()
    func printNotifications()
}
