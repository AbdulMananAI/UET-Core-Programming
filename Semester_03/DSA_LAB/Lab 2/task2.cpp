#include<iostream>
using namespace std;
int main(){
    int* array = new int[5];
    cout << "Enter 5 integers: ";
    for (int i=0; i<5; i++){
        cin >> array[i];
    };

    cout << "Array: ";
    for (int i=0; i<5; i++){
        cout << array[i] << " ";
    };
    delete array;
    return 0;
}