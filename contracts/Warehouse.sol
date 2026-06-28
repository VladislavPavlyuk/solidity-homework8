// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Warehouse {

    struct Product {
        string name;  
        uint quantity; 
    }

    // 3. Створюємо динамічний масив товарів 
    Product[] public products;

    constructor() {
        // Додаємо стартовий товар для тесту
        products.push(Product("Laptop", 10));
    }

    // 4. Функція, яка змінює товар через змінну типу storage 
    function updateWithStorage(uint _index, uint _newQty) public {
        Product storage prod = products[_index]; // створює вказівник на оригінал 
        prod.quantity = _newQty; // ЗМІНИ ЗБЕРЕЖУТЬСЯ в блокчейні 
    }

    // 4. Функція, яка працює з копією товару через memory 
    function updateWithMemory(uint _index, uint _newQty) public view returns (Product memory) {
        Product memory prod = products[_index]; // створює незалежну копію в пам'яті 
        prod.quantity = _newQty; // Зміна відбувається ТІЛЬКИ в пам'яті 
        return prod; // Повертає змінену тимчасову копію, але оригінал в масиві залишається старим 
    }
    
    // 5. РЕЗУЛЬТАТ ПОРІВНЯННЯ: updateWithStorage змінює стан назавжди. updateWithMemory залишає базу даних незмінною.
}