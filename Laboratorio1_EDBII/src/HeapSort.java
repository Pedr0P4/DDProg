public class HeapSort {
    //Função principal do heapSort.
    public void heapSort(int[] array) {
        int n = array.length;

        for (int i = n / 2 - 1; i >= 0; i--) {
            heapify(array, i, n);
        }
        for(int i = n - 1; i > 0; i--) {
            swap(array, 0, i);
            heapify(array, 0, i);
        }
    }

    //Função heapify para maximizar o nó pai.
    private void heapify(int[] array, int index, int len) {
        int max = index;
        int left = 2 * index + 1;
        int right = 2 * index + 2;

        if(left < len && array[left] > array[max]) {
            max = left;
        }
        if(right < len && array[right] > array[max]) {
            max = right;
        }

        if(index != max) {
            swap(array, max, index);
            heapify(array, max, len);
        }
    }

    private void swap(int[] array, int i, int j) {
        int temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
}
