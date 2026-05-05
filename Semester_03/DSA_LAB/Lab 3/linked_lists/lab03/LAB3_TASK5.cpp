#include <iostream>
using namespace std;

class Node {
public:
    int data;
    Node* next;
};

// --- Basic Operations ---
void insertAtEnd(Node*& head, int value) {
    Node* newNode = new Node();
    newNode->data = value;
    newNode->next = NULL;
    if(head == NULL) {
        head = newNode;
        return;
    }
    Node* current = head;
    while(current->next != NULL) {
        current = current->next;
    }
    current->next = newNode;
}

void insertAtBeginning(Node*& head, int value) {
    Node* newNode = new Node();
    newNode->data = value;
    newNode->next = head;
    head = newNode;
}

void display(Node* head) {
    Node* current = head;
    while(current != NULL) {
        cout << current->data << " -> ";
        current = current->next;
    }
    cout << "NULL" << endl;
}

bool search(Node* head, int key) {
    Node* current = head;
    while(current != NULL) {
        if(current->data == key)
            return true;
        current = current->next;
    }
    return false;
}

void deleteFirst(Node*& head) {
    if(head == NULL) {
        cout << "List is empty" << endl;
        return;
    }
    Node* temp = head;
    head = head->next;
    delete temp;
    cout << "First node deleted." << endl;
}

// --- Main Menu Driver ---
int main() {
    Node* head = NULL;
    int choice, value;

    do {
        cout << "\n--- Linked List Menu ---" << endl;
        cout << "1. Insert at Beginning" << endl;
        cout << "2. Insert at End" << endl;
        cout << "3. Display List" << endl;
        cout << "4. Search Element" << endl;
        cout << "5. Delete First Node" << endl;
        cout << "6. Exit" << endl;
        cout << "Enter your choice: ";
        cin >> choice;

        switch(choice) {
            case 1:
                cout << "Enter value to insert at beginning: ";
                cin >> value;
                insertAtBeginning(head, value);
                break;
            case 2:
                cout << "Enter value to insert at end: ";
                cin >> value;
                insertAtEnd(head, value);
                break;
            case 3:
                cout << "Current List: ";
                display(head);
                break;
            case 4:
                cout << "Enter element to search: ";
                cin >> value;
                if(search(head, value))
                    cout << value << " Found in the list." << endl;
                else
                    cout << value << " Not Found." << endl;
                break;
            case 5:
                deleteFirst(head);
                break;
            case 6:
                cout << "Exiting program..." << endl;
                break;
            default:
                cout << "Invalid choice! Please try again." << endl;
        }
    } while(choice != 6);

    return 0;
}