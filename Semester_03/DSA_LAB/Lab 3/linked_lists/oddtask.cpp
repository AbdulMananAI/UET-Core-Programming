#include <iostream>
using namespace std;

class Employee {
public:
    string name;
    int id;
    Employee(string n, int i){
        name = n;
        id = i; 
    }
    void displayInfo() {
        cout << "Employee Name: " << name << "\nEmployee ID number: " << id << endl;
    }
};

int main() {
    string name;
    cout<<"Enter the employee name: ";
    cin>>name;
    int id;
    cout<<"Enter the employee id: ";
    cin>>id;
    Employee* emp = new Employee(name, id);
        emp->displayInfo();
        emp = nullptr;
        delete emp;
    return 0;
};