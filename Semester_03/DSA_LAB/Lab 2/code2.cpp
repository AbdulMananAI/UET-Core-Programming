//TASK 2 – ADD A CONSTRUCTOR
//TASK 2 – ADD A CONSTRUCTOR
#include <iostream>
#include <string> // Added to support the string type

using namespace std; // Added to resolve string, cout, and endl

class Student {
public:
    string name;
    int rollNo;
    
    // Constructor
    Student(string n, int r) {
        name = n;
        rollNo = r;
    }

    void display() {
        cout << name << " - " << rollNo << endl;
    }
};

int main() {
    Student s1("Sara", 102);
    s1.display();
    
    return 0;
}