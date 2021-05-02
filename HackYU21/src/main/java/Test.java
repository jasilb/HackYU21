import java.time.Duration;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;

public class Test {
	Subject subject;
	int month;
	int day;
	Calendar dueDate;
	String title;
	double CalculatedPriority;

	public Test(Subject subject, int month, int day, String title) {
		this.subject = subject;
		this.dueDate = new Calendar.Builder().setDate(LocalDate.now().getYear(),month,day).build();
		this.title = title;
		CalculatedPriority  = subject.getPriority()* ((System.currentTimeMillis()-dueDate.getTime().getTime())/100);

	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}


	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Calendar getDueDate() {
		return dueDate;
	}

	public void setDueDate(Calendar dueDate) {
		this.dueDate = dueDate;
	}

	public double getCalculatedPriority() {
		CalculatedPriority  = subject.getPriority()* ((System.currentTimeMillis()-dueDate.getTime().getTime())/100);
		return CalculatedPriority;
	}

}