import java.util.Random;

public class BogoSort {
    //Função principal do bogo sort.
    public void bogoSort(int[] array) {
        int reps = 0;
        while(!isSorted(array)) {
            shuffle(array);
            reps++;
        }
        System.out.println("Essa bomba ordenou em " + reps + " passos!!");
    }

    //Função para verificar se está ordenado (Sort'eado. Acabei de inventar essa kkkk).
    private boolean isSorted(int[] array) {
        int len = array.length;
        if(array.length == 0) {
            return true;
        }

        for(int i = 0; i < len-1; i++) {
            if(array[i] > array[i+1]) {
                return false;
            }
        }

        return true;
    }

    //Função para embaralhar o array (Para o caos, aqui é o começo e o fim...).
    private void shuffle(int[] array) {
        Random rand = new Random();
        for(int i = 0; i < array.length; i++) {
            int index = rand.nextInt(array.length);
            int temp = array[index];
            array[index] = array[i];
            array[i] = temp;
        }
    }
}
