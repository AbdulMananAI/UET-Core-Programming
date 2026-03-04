#include<iostream>
using namespace std;
class Car {
    public:
    string brand;
    string model;

    Car(string br, string mod) {
        brand = br;
        model = mod;
    }
    void display() {
        cout << "Brand: " << brand << endl;
        cout << "Model: " << model << endl;
    }

};
int main() {
    Car car1("Hyudai", "Palisade");
    car1.display();
    return 0;
}