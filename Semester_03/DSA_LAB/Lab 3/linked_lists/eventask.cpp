#include <iostream>
using namespace std;

class Rectangle{
    int length;
    int width;
    Rectangle(int l, int w){
        length = l;
        width = w;
    }
    int area(){
        return length * width;
    }
    void displayArea(){
        cout<<"The length is: "<<length<<endl;
        cout<<"The width is: "<<width<<endl;
        cout<<"The area of the rectangle is: "<<area()<<endl;
    }
};
int main() {
    int length, width;
    cout<<"Enter the length of the rectangle: ";
        cin>>length;
        cout<<"Enter the width of the rectangle: ";
        cin>>width;
    Rectangle* rect = new Rectangle(length, width);
        rect->displayArea();
}