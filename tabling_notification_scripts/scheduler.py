from tabling_notifications import TablingNotifier
from apscheduler.schedulers.blocking import BlockingScheduler

class JobManager:

    LOCAL_TIMEZONE = 'America/Los_Angeles'

    def __init__(self):
        self.notifier = TablingNotifier()
        self.sched = BlockingScheduler(timezone=self.LOCAL_TIMEZONE)
        self.add_reminder_jobs()
        self.add_tabling_notification_job()
        self.add_update_job()

    # Adds cron jobs for each time slot
    def add_reminder_jobs(self):
        jobs = []
        for time in self.notifier.member_emails.keys():
            day = time // 24
            hour = time % 24 - 1 # Want to remind an hour before the tabling slot
            self.sched.add_job(self.reminder_job(time), trigger='cron',  day_of_week=str(day), hour=str(hour))

    # Creates and returns an anonymous function to use in 'add_reminder_jobs'         
    def reminder_job(self, time):
        def job():
            self.notifier.remind_time_slot(time)
        return job

    def add_tabling_notification_job(self):
        self.sched.add_job(self.notifier.notify_time_slots, trigger='cron', month='1-5,8-12', day_of_week=6)

    def add_update_job(self):
        def job():
            self.notifier.update()
        # Updates the time slot members every 10 minutes (to keep track of time switches)
        self.sched.add_job(job, trigger='interval', minutes=10)
            
    def start(self):
        self.sched.start()
    
if __name__ == '__main__':
    manager = JobManager()
    manager.start()

