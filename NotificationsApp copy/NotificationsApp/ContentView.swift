//
//  ContentView.swift
//  NotificationsApp
//
//  Created by Amaal Ali Alsaeedi on 06/06/1445 AH.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @State var selectedDate = Date()
    @State var selectedDate2 = Date()
    @State var notificationCount = 1
    let notify = NotificationHandler()
        
    var body: some View {
        ZStack{
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.93, green: 0.96, blue: 1), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.93, green: 0.96, blue: 1), location: 0.16),
                    Gradient.Stop(color: Color(red: 0.74, green: 0.89, blue: 0.99), location: 0.34),
                    Gradient.Stop(color: Color(red: 1, green: 1, blue: 1), location: 0.59),
                    ],
                startPoint: UnitPoint(x: 0.5, y: 0.18),
                endPoint: UnitPoint(x: 0.5, y: 2.17)
            )
            .edgesIgnoringSafeArea(.all)

        VStack(spacing: 20) {
            
            Spacer()
                        Stepper(value: $notificationCount, in: 0...5, step: 1) {
                            Text("    No. notification: \(notificationCount)")
                        }.frame(width: 360, height: 50)
                .background(Color(red: 0.77, green: 0.89, blue: 1))

                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
//            Button(""){
//                
//            }
//            Button("Send notification in 5 seconds") {
//                notify.sendNotification(date: Date(), type: "time", timeInterval: 5, title: "5 second notification", body: "You can write more in here!")
//                        }
                        DatePicker("    Pick the Start time:", selection: $selectedDate, displayedComponents: [.hourAndMinute])
                .frame(width: 360, height: 50)
                .background(Color(red: 0.77, green: 0.89, blue: 1))

                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        DatePicker("    Pick the End time:", selection: $selectedDate2, displayedComponents: [.hourAndMinute])
                .frame(width: 360, height: 50)
        .background(Color(red: 0.77, green: 0.89, blue: 1))

        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                              // Remove the DatePicker line
            Spacer()

            Button("Schedule notification") {
                            notify.sendNotification(date: selectedDate, type: "date", timeInterval: 0, title: "Scheduled notification", body: "This notification is scheduled at a specific date and time.")
                        }.frame(width: 150, height: 60)
                .background(Color(red: 0.77, green: 0.89, blue: 1))

                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
            
                .accentColor(.black).bold()
                        Spacer()
                        Text("Not working?")
                            .foregroundColor(.gray)
                            .italic()
                        Button("Request permissions") {
                            notify.askPermission()
                        }
                    }
                    .padding()
                }
}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//class NotificationHandler1 {
//    func sendNotification(date: Date, type: String, timeInterval: TimeInterval, title: String, body: String) {
//        let content = UNMutableNotificationContent()
//        content.title = title
//        content.body = body
//        
//        let trigger: UNNotificationTrigger
//        if type == "time" {
//            trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
//        } else if type == "date" {
//            let components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
//            trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
//        } else {
//            fatalError("Invalid notification type")
//        }
//        
//        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//        UNUserNotificationCenter.current().add(request) { error in
//            if let error = error {
//                print("Failed to schedule notification: \(error)")
//            }
//        }
//    }
//    
//    func askPermission() {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
//            if granted {
//                print("Notification permission granted")
//            } else if let error = error {
//                print("Failed to request notification permission: \(error)")
//            }
//        }
//    }
//}
