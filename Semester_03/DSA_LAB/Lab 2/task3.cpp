#include<iostream>
using namespace std;
class Car{
 public:
   string colour;
   int wheels;

   Car(string col, int wh)
   {
    colour = col;
    wheels = wh;
   };

   void display()
   {
    cout << "Colour: " << colour << endl;
    cout << "Wheels: " << wheels << endl;
   }

};

int main(){
    Car* car1 = new Car("black", 4);
    car1->display();
    Car* car2 = new Car("white", 4);
    car2->display();

    delete car1;
    delete car2;

    return 0;
}
    
