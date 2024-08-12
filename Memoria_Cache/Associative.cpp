#include <iostream>

using namespace std;

int list_min(int* list, int list_tam){
    int min = list[0];
    for(int i=0;i<list_tam-1;i++){
        if(list[i] >= list[i+1]) min = list[i+1];
    }
    return min;
}

int list_min_index(int* list, int list_tam){
    int index = 0;
    for(int i=0;i<list_tam-1;i++){
        if(list[i] > list[i+1]) index++;
    }
    return index;
}

class cache{
    private:
        int cache_tam = 4;
        int spaces[4] = {-1, -1, -1, -1};
        int uses[4] = {0, 0, 0, 0};
        int block_tam = 8;
        bool check = false;
    public:
        void add_block(int adress){
            int block = adress / this->block_tam;
            for(int i=0;i<this->cache_tam;i++){
                if(this->spaces[i] == -1){
                    this->spaces[i] = block;
                    this->uses[i]++;
                    this->check = true;
                    break;
                } else{
                    this->check = false;
                }
            }
            cout << this->check << endl;
            if(!this->check){
                //cout << "Não" << endl;
                int LFU = list_min_index(this->uses, this->cache_tam);
                cout << "indice: " << LFU << endl;
                this->spaces[LFU] = block;
                this->uses[LFU] = 1;
                this->check = false;
            }
        }

        bool check_cache(int adress){
            int block = adress / this->block_tam;
            for(int i=0;i<this->cache_tam;i++){
                if(this->spaces[i] == block){
                    return true;
                }
            }
            return false;
        }

        int* get_spaces(){
            return this->spaces;
        }

        int* get_uses(){
            return this->uses;
        }

        int get_cache_tam(){
            return this->cache_tam;
        }

        int get_block(int adress){
            return adress / this->block_tam;
        }

        void add_use(int adress){
            int block = adress / this->block_tam;
            for(int i=0;i<this->cache_tam;i++){
                if(this->spaces[i] == block){
                    this->uses[i]++;
                    break;
                }
            }
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
        cout << "Block: " << Cache.get_block(temp) << endl;
        if(!Cache.check_cache(temp)) Cache.add_block(temp);
        else{
            cout << "Hitou" << endl;
            hits++;
            Cache.add_use(temp);
        }
    }

    cout << "Hits: " << hits << "\n" << "Tamanho: " << tamanho << endl;

    float razao = ((float)hits / (float)tamanho)*100;

    cout << "A taxa de hit é: " << razao << "%" << endl;

    return 0;
}