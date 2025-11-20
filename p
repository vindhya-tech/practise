A hosptal wants to underatsnd how different users and sytem interacted during the apppointmnet managemnt process. the goal is to how a patent ,docoter and appotmnet system 
activies booking ,modifying canceling and being notigies about appointmnet.
draw Class diagram


+------------------+          1..*          +------------------+
|      Patient     |------------------------>|   Appointment    |
+------------------+                         +------------------+
| - patientID      |                         | - appointmentID  |
| - name           |                         | - dateTime       |
| - contactInfo    |                         | - status         |
+------------------+                         | - reason         |
| + bookAppointment()     |                  | - notificationLog|
| + modifyAppointment()   |                  +------------------+
| + cancelAppointment()   |                  | + updateStatus() |
| + receiveNotification() |                  | + addLog()       |
+------------------+                         +------------------+

                         1..* 
                         |
                         v
+------------------+     |      1..*     +----------------------+
|      Doctor      |-------------------->| AppointmentSchedule  |
+------------------+                     +----------------------+
| - doctorID       |                     | - scheduleID         |
| - name           |                     | - availableSlots     |
| - specialty      |                     | - doctorID           |
+------------------+                     +----------------------+
| + viewSchedule() |                     | + checkAvailability()|
| + confirm()      |                     +----------------------+
| + updateSlot()   |
+------------------+

                     uses
                       |
                       v
+----------------------------+
|     AppointmentSystem      |
+----------------------------+
| + createAppointment()      |
| + modifyAppointment()      |
| + cancelAppointment()      |
| + notifyUsers()            |
| + validateAvailability()   |
+----------------------------+
           ^           ^
           |           |
           |           |
  interacts|           |interacts
           |           |
+------------------+   +------------------+
|    Notification  |   |   UserAccount    |
+------------------+   +------------------+
| - message        |   | - userID         |
| - timestamp      |   | - username       |
| - recipient      |   | - passwordHash   |
+------------------+   +------------------+
| + send()         |   | + authenticate() |
+------------------+   +------------------+
