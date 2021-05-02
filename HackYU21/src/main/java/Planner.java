import java.util.*;

public class Planner {

    HashMap<String,Subject> subjects = new HashMap<>();
    ArrayList<Test> tests = new ArrayList<>();
    public Planner() {
    }

    public void AddSubject(String name, double priority, double totalDuration){
        Subject subject = new Subject(name,priority,totalDuration);
        subjects.put(name,subject);
    }
    public void AddTest(String subject, int month, int day, String title){
        Subject subject1 = subjects.get(subject);
        tests.add(new Test(subject1,month,day,title));
    }
    public List<Test> MakeCalender(double available){
        Comparator<Test> comparator = new Comparator<Test>() {
            @Override
            public int compare(Test test1, Test test2) {
                return (int) ((test1.getCalculatedPriority()-test2.getCalculatedPriority())*10);
            }
        };
        tests.sort(comparator);
        int x=0;
        ArrayList<Test> calender = new ArrayList<>();
        while (x>=tests.size()|| available-tests.get(x).subject.totalDuration>=0){
            calender.add(tests.get(x));
            available-=tests.get(x).subject.totalDuration;
            x++;
        }
        return calender;
    }












}
