//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        String[] p1 = {args[0], args[1]};
        String[] p2 = {args[2], args[3]};
        double dist = Math.sqrt(Math.pow((Double.parseDouble(p2[0]) - Double.parseDouble(p1[0])), 2) + Math.pow((Double.parseDouble(p2[1]) - Double.parseDouble(p1[1])), 2));

        System.out.printf("%.4f", dist);
    }
}