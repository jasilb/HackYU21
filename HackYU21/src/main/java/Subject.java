import java.util.Objects;

class Subject {

	String name;
	double priority;

	double totalDuration;

	public Subject(String name, double priority, double totalDuration) {
		this.name = name;
		this.priority = priority;
		this.totalDuration = totalDuration;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPriority() {
		return priority;
	}

	public void setPriority(double priority) {
		this.priority = priority;
	}

	public double getTotalDuration() {
		return totalDuration;
	}

	public void setTotalDuration(double totalDuration) {
		this.totalDuration = totalDuration;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		Subject subject = (Subject) o;
		return Double.compare(subject.priority, priority) == 0 && Double.compare(subject.totalDuration, totalDuration) == 0 && Objects.equals(name, subject.name);
	}

	@Override
	public int hashCode() {
		return Objects.hash(name, priority, totalDuration);
	}
}
