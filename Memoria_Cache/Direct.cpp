#include <iostream>

using namespace std;

class cache{
    private:
        int cache_tam = 4;
        int spaces[4] = {-1, -1, -1, -1};
        int block_tam = 8;
    public:
        void add_block(int adress){
            int block = adress / this->block_tam;
            this->spaces[block % this->cache_tam] = block;
        }

        bool check_cache(int adress){
            int block = adress / this->block_tam;
            if(this->spaces[block % this->cache_tam] == block) return true;
            return false;
        }

        int* get_space(){
            return this->spaces;
        }

        int get_cache_tam(){
            return this->cache_tam;
        }
};

int main(){

    cache Cache;
    unsigned int tamanho;
    unsigned int temp;
    int hits = 0;

    cout << "Quantos endereços deseja verificar? ";
    cin >> tamanho;

    cout << "Digite os endereços:" << endl;
    for(int i=0; i<tamanho; i++){
        cin >> temp;
        if(!Cache.check_cache(temp)) Cache.add_block(temp);
        else hits++;
    }

    cout << "Hits: " << hits << "\n" << "Tamanho: " << tamanho << endl;

    float razao = ((float)hits / (float)tamanho)*100;

    cout << "A taxa de hit é: " << razao << "%" << endl;

    return 0;
}