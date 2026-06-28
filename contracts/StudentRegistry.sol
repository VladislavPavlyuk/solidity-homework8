// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract StudentRegistry {

    // 1. Створюємо структуру Student
    struct Student {
        string name;
        uint age;   
    }

    // 2. Створюємо динамічний масив студентів у storage 
    Student[] public students;

    // 3. Функція додавання нового студента 
    // Використовуємо calldata для _name, оскільки рядок лише читається і не змінюється (економить газ) 
    function addStudent(string calldata _name, uint _age) public {
        students.push(Student(_name, _age));
    }

    // 3. Функція, яка повертає інформацію про студента за індексом 
    // Модифікатор view, бо функція тільки читає стан 
    // Повертає структуру за допомогою memory, оскільки створюється тимчасова копія для виведення
    function getStudent(uint _index) public view returns (Student memory) {
        return students[_index];
    }

    // 3. Функція повертає кількість студентів 
    // Модифікатор view, бо ми читаємо довжину масиву зі стану 
    function studentsCount() public view returns (uint) {
        return students.length;
    }
}