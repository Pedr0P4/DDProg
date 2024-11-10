public class MergeSort {
    //Função principal do merge sort.
    public void mergeSort(int[] array) {
        int length = array.length;

        if (length < 2) {
            return;
        }

        int middle = length / 2;
        int[] left = new int[middle];
        int[] right = new int[length - middle];

        for (int i = 0; i < middle; i++) {
            left[i] = array[i];
        }
        for(int i = middle; i < length; i++) {
            right[i - middle] = array[i];
        }


        mergeSort(left);
        mergeSort(right);

        merge(array, left, right);;
    }

    //Função para fundir (merge) de forma ordenada os pedaços que foram separados.
    private void merge(int[] array, int[] left, int[] right) {
        int i = 0, j = 0, k = 0;
        while (i < left.length && j < right.length) {
            if (left[i] <= right[j]) {
                array[k++] = left[i++];
            } else{
                array[k++] = right[j++];
            }
        }

        while (i < left.length) {
            array[k++] = left[i++];
        }
        while (j < right.length) {
            array[k++] = right[j++];
        }
    }
}
