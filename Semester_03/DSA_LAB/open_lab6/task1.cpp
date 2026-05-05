#include <iostream>
using namespace std;

class Node {
public:
    int data;
    Node* next;

    Node(int value) {
        data = value;
        next = nullptr;
    }
};

class Stack {
public:
    Node* top;
    Stack() {
        top = nullptr;
    }

    void push(int value) {
        Node* newNode = new Node(value);
        if (!newNode) {
            cout << "Node creation failed." << endl;
            return;
          }
        newNode->next = top;
        top = newNode;
        cout << "Pushed: " << value << endl;
    }

    void pop() {
        if (isEmpty()) {
            cout << "The stack is already empty." << endl;
            return;
        }
        Node* temp = top;
        top = top->next;
        cout << "Popped: " << temp->data << endl;
        delete temp;
    }

    int peek() {
        if (isEmpty()) {
            cout << "Stack is empty!" << endl;
            return -1;
        }
        return top->data;
    }

    bool isEmpty() {
        return top == nullptr;
    }

    void display() {
        if (isEmpty()) {
            cout << "The stack is currently empty." << endl;
            return;
        }
        Node* current = top;
        cout << "Current Stack : ";
        while (current != nullptr) {
            cout << current->data << " -> ";
            current = current->next;
        }
        cout << "NULL" << endl;
    }
};

int main() {
    Stack myStack1;
    cout << "\nIs stack empty? " << (myStack1.isEmpty() ? "Yes" : "No") << endl;

    cout << "\nPushing 10 Elements:" << endl;
        myStack1.push(2); 
        myStack1.push(4);
        myStack1.push(6);
        myStack1.push(8);
        myStack1.push(10);
        myStack1.push(12);
        myStack1.push(14);
    

    cout << "\nDisplaying Stack:" << endl;
    myStack1.display();

    cout << "\nPeeking at Top Element:" << endl;
    cout << "Top element is: " << myStack1.peek() << endl;

    cout << "\nPopping Elements:" << endl;
    myStack1.pop();
    myStack1.pop();
    myStack1.pop();

    cout << "\ncurrent Stack Status:" << endl;
    myStack1.display();
    cout << "Current top element is: " << myStack1.peek() << endl;
    cout << "\nIs stack empty? " << (myStack1.isEmpty() ? "Yes" : "No") << endl;

    return 0;
}

