//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
import java.util.Arrays;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        MergeSort mergeSort = new MergeSort();
        HeapSort heapSort = new HeapSort();
        BogoSort bogoSort = new BogoSort();

        int[] array = new int[10];

        System.out.println("Digite 10 números: ");
        for (int i = 0; i < array.length; i++) {
            array[i] = scanner.nextInt();
        }

        int[] tempArray = new int[array.length];
        System.arraycopy(array, 0, tempArray, 0, array.length);

        System.out.println("Array desodernado (mergeSort):");
        System.out.println(Arrays.toString(array));
        System.out.println("Array ordenado (mergeSort):");
        mergeSort.mergeSort(array);
        System.out.println(Arrays.toString(array));

        System.arraycopy(tempArray, 0, array, 0, array.length);

        System.out.println("\nArray desodernado (heapSort):");
        System.out.println(Arrays.toString(array));
        System.out.println("Array ordenado (heapSort):");
        heapSort.heapSort(array);
        System.out.println(Arrays.toString(array));

        System.arraycopy(tempArray, 0, array, 0, array.length);

        System.out.println("\nArray desodernado (bogoSort):");
        System.out.println(Arrays.toString(array));
        System.out.println("Array ordenado (bogoSort):");
        bogoSort.bogoSort(array);
        System.out.println(Arrays.toString(array));
    }
}