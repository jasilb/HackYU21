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
}
