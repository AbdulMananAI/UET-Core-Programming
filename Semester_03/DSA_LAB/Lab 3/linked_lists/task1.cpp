#include <iostream>
using namespace std;

// 1. Define the Node
struct Node {
    int data;
    Node* next;
};

// A function to print the linked list
void printList(Node* n) {
    // Keep going until we hit nullptr (the end of the list)
    while (n != nullptr) {
        cout << n->data << " -> ";
        n = n->next; // Move to the next node
    }
    cout << "NULL" << endl;
}

int main() {
    // 2. Create pointers for our nodes
    Node* head = nullptr;
    Node* second = nullptr;
    Node* third = nullptr;
    Node* fourth = nullptr;

    // 3. Allocate memory for the nodes in the heap using 'new'
    head = new Node();
    second = new Node();
    third = new Node();
    fourth = new Node();

    // 4. Assign data and link the nodes together
    
    // Setup first node (Head)
    head->data = 1;        // Assign data
    head->next = second;   // Point to the second node

    // Setup second node
    second->data = 2;      // Assign data
    second->next = third;  // Point to the third node

    // Setup third node (Tail)
    third->data = 3;       // Assign data
    third->next = fourth;  // Point to the fourth node

    // Setup fourth node (Tail)
    fourth->data = 4;      // Assign data
    fourth->next = nullptr; // Point to NULL because it's the last node

    // 5. Print the list
    printList(head);

    return 0;
}